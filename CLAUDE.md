# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Run tests
flutter test

# Run a single test file
flutter test test/snodes_test.dart

# Regenerate mapper/serialization code after changing SNode/PNode/model classes
dart run build_runner build --delete-conflicting-outputs

# Watch mode for codegen during development
dart run build_runner watch --delete-conflicting-outputs

# Run either example app
cd example_using_go_router && flutter run
cd example_without_go_router && flutter run
```

## Architecture

### Core Concept: Snippets

A **snippet** is a named, versioned, Firestore-persisted tree of `SNode` objects that renders as a Flutter widget subtree. Snippets can be edited visually at runtime (in dev) and published without rebuilding the app. Each snippet has an editing version and a published version stored in Firestore.

### Key Abstractions

**`SNode`** (`lib/src/snippet/snode.dart`) — Abstract base for all widget nodes. Three structural subclasses:
- `CL` (childless) — leaf widgets: `TextNode`, `GapNode`, `AssetImageNode`, `QuillTextNode`, etc.
- `SC` (single child) — `ContainerNode`, `PaddingNode`, `CenterNode`, `SnippetRootNode`, etc.
- `MC` (multi-child) — `RowNode`, `ColumnNode`, `StackNode`, `WrapNode`, etc.

Each SNode implements `toWidget()`, `propertyNodes()` (returns PNodes for editing UI), and `widgetLogo()`. SNodes are serialized to/from JSON via `dart_mappable` with discriminator key `'DK:snode'`. Every SNode has a `uid` (UniqueKey string).

**`PNode`** (`lib/src/snippet/pnode.dart`) — Property nodes represent editable properties of an SNode. ~108 types in `lib/src/snippet/pnodes/`. Three style groups aggregate related PNodes: `TextStyleProperties`, `ButtonStyleProperties`, `ContainerStyleProperties`.

**`fco`** (`lib/flutter_content.dart`) — Global singleton of `FlutterContentMixins`. Acts as service locator: `fco.capiBloc`, `fco.appInfo`, `fco.modelRepo`, `fco.selectedNode`, `fco.showToast(...)`, etc. Composed from ~15 mixins.

**`CAPIBloC`** (`lib/src/bloc/capi_bloc.dart`) — Central BLoC managing all editor state: active snippet, selected node, undo/redo stack, authentication. Fire events via `fco.capiBloc.add(CAPIEvent.selectNode(node: node))`.

**`FlutterContentApp`** (`lib/src/api/app/fco_app.dart`) — Root widget that must wrap the host app's `MaterialApp`. Provides the `CAPIBloC`, Firebase init, and overlay infrastructure. Two constructors: `FlutterContentApp({home: ...})` and `FlutterContentApp.router({routerConfig: ...})`.

### Code Generation

All `SNode`, `PNode`, and model classes use `dart_mappable`. Each annotated class has a `part 'filename.mapper.dart'` and calls `XyzMapper.ensureInitialized()` in the package init. **Run `build_runner` after any change to these classes.** Never hand-edit `.mapper.dart` files.

### Editing UI

`EditablePage` (`lib/src/api/editable_page/editable_page.dart`) is the main editor scaffold. It overlays tappable `NodeRenderData` border rects onto the live widget tree. `QuillTextNode` and `MarkdownNode` are excluded from this overlay (they have their own inline editors).

`SNodeWidget` (`lib/src/snippet/snode_widget.dart`) renders one row in the snippet tree panel on the left side of the editor.

`menuAnchorWidgets*` methods on `SNode` build the nested `SubmenuButton` menus for node insertion actions (`addChild`, `wrapWith`, `replaceWith`, `addSiblingBefore/After`).

### Adding a New SNode Type

1. Create `lib/src/snippet/snodes/my_widget_node.dart` — extend `CL`, `SC`, or `MC`, annotate with `@MappableClass`, add `part 'my_widget_node.mapper.dart'`.
2. Add to the appropriate list in `snode.dart`: `childlessSubClasses`, `singleChildSubClasses`, or `multiChildSubClasses`.
3. Export from `lib/flutter_content.dart`.
4. Add to the `menuAnchorWidgets_*` methods in `snode.dart` so it appears in the editor menus.
5. Run `build_runner`.
