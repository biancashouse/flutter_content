import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_builder/tr_triangle_painter.dart'
    show TRTriangle;
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'snippet_root_node.mapper.dart';

// class SnippetRootNodeHook extends MappingHook {
//   const SnippetRootNodeHook();
//
//   @override
//   Object? beforeDecode(Object? value) {
//     // fco.logger.i('before');
//     return value;
//   }
//
//   @override
//   Object? afterDecode(Object? value) {
//     // fco.logger.i('after');
//     return value;
//   }
// }

@MappableClass() //discriminatorKey: 'DK:sr', includeSubClasses: [TitleSnippetRootNode, SubtitleSnippetRootNode, ContentSnippetRootNode])
class SnippetRootNode extends SC with SnippetRootNodeMappable {
  SnippetName name;

  // RoutePath? routePath;
  // bool isEmbedded;
  String tags;

  SnippetRootNode({
    required this.name,
    // this.routePath,
    // this.isEmbedded = false,
    this.tags = '',
    super.child,
  }) {
    // fco.logger.i('SnippetRootNode created with uid: $uid');
  }

  /// snippet's scrollcontroller
  /// this might get set by a scrollable descendant if that node has
  /// set property: listenToThisScrollController = true
  // ScrollController? _scrollController;
  // Axis? _scrollDirection;
  //
  // ScrollController? get scrollController => _scrollController;
  //
  // set scrollController(ScrollController value) {
  //   _scrollController = value;
  // }
  //
  // Axis get scrollDirection => _scrollDirection ?? Axis.vertical;
  //
  // set scrollDirection(Axis value) {
  //   _scrollDirection = value;
  // }

  static bool isHotspotCalloutContent(String sname) =>
      int.tryParse(sname) != null || /*legacy*/ sname.startsWith('T-');

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    StringPNode(
      snode: this,
      name: 'tags',
      stringValue: tags.toString(),
      onStringChange: (newValue) {
        refreshWithUpdate(context, () => tags = newValue ?? '');
      },
      calloutButtonSize: const Size(280, 70),
      calloutWidth: 280,
    ),
    // StringPNode(
    //   snode: this,
    //   name: 'Snippet Name',
    //   stringValue: name,
    //   onStringChange: (newValue) => refreshWithUpdate(context,() => name = newValue??''),
    //   calloutButtonSize: const Size(280, 70),
    //   calloutWidth: 280,
    // ),
    // PropertyGroup(
    //   snode: this,
    //   name: 'Page Snippet...',
    //   children: [
    //     StringPNode(
    //       snode: this,
    //       name: 'Snippet Name',
    //       stringValue: name,
    //       onStringChange: (newValue) => refreshWithUpdate(context,() => name = newValue??''),
    //       calloutButtonSize: const Size(280, 70),
    //       calloutWidth: 280,
    //     ),
    // StringPNode(
    //   snode: this,
    //   name: 'Route Path',
    //   stringValue: routePath,
    //   onStringChange: (newValue) => refreshWithUpdate(context,() => routePath = newValue),
    //   calloutButtonSize: const Size(280, 70),
    //   calloutWidth: 280,
    // ),
    //   ],
    // ),
    // BoolPNode(
    //   snode: this,
    //   name: 'isEmbedded',
    //   boolValue: isEmbedded,
    //   onBoolChange: (newValue) => refreshWithUpdate(context,() => isEmbedded = newValue ?? false),
    // ),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    CAPIBloC bloc = context.read<CAPIBloC>();

    var snippetInfo = fco.appInfo.cachedSnippetInfo(name);

    if (snippetInfo?.hide ?? false) {
      return const Offstage();
    }

    // only use a FutureBuilder if abs necc
    var snippet = snippetInfo?.currentVersionInCache();
    try {
      // fco.logger.i("SnippetRootNode.toWidget($name)...");
      // if (findDescendant(SnippetRootNode) != null) {}
      setParent(parentNode);

      // SnippetInfoModel.debug();
      if (snippet != null) {
        // already cached
        Widget snippetWidget =
            snippet.child?.buildFlutterWidget(context, this) ??
            Icon(Icons.warning, color: Colors.red, size: 24);

        // guest or editing or selecting a widget node
        if (!bloc.state.isSignedIn ||
            bloc.aSnippetIsBeingEdited() ||
            bloc.showTappableBorderRects()) {
          return snippetWidget;
        }

        // signed in
        return _wrapWithTriangleAndBanner(snippetInfo!, snippetWidget);
      }

      return FutureBuilder<SnippetRootNode?>(
        future: SnippetRootNode.loadSnippetFromCacheOrFromFB(snippetName: name),
        builder: (futureContext, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // fco.logger.i("FutureBuilder<void> Ensuring $name present");
            try {
              // in case did a revert, ignore snapshot data and use the AppInfo instead
              SnippetRootNode? snippet =
                  snapshot.data; //fco.currentSnippetVersion(name);
              // SnippetRootNode? snippetRoot = cache?[editingVersionId];
              Widget snippetWidget = snippet == null
                  ? Error(
                      key: createNodeWidgetGK(),
                      FLUTTER_TYPE,
                      color: Colors.red,
                      size: 16,
                      errorMsg: "null snippet!",
                    )
                  : snippet.child?.buildFlutterWidget(futureContext, this) ??
                        const FlexibleSpaceBar(background: Placeholder());
              snippet?.validateTree();
              if (!(snippet?.isValid() ?? false)) {
                return const Offstage();
              }

              // guest or editing or selecting a widget node
              if (!bloc.state.isSignedIn ||
                  bloc.aSnippetIsBeingEdited() ||
                  bloc.showTappableBorderRects()) {
                return snippetWidget;
              }

              // signed in
              var snippetInfo = fco.appInfo.cachedSnippetInfo(name);
              return _wrapWithTriangleAndBanner(snippetInfo!, snippetWidget);
            } catch (e) {
              return Error(
                key: createNodeWidgetGK(),
                FLUTTER_TYPE,
                color: Colors.red,
                size: 16,
                errorMsg: e.toString(),
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    } catch (e) {
      return Error(
        key: createNodeWidgetGK(),
        FLUTTER_TYPE,
        color: Colors.red,
        size: 16,
        errorMsg: e.toString(),
      );
    }
  }

  Widget _wrapWithTriangleAndBanner(
    SnippetInfoModel snippetInfo,
    Widget snippetWidget,
  ) {
    bool editingPublishedVersion =
        snippetInfo.publishedVersionId == snippetInfo.editingVersionId;

    return fco.canEditContent()
        ? ValueListenableBuilder<String>(
            // must assume snippetInfo will be in cache
            valueListenable: snippetInfo.getChangeNotifier(),
            builder: (context, value, child) => _sizedBox(
              snippetWidget,
              editingPublishedVersion,
              snippetInfo.changesPending(value),
            ),
          )
        : _sizedBox(snippetWidget, editingPublishedVersion, false);

    // //TODO warn user if in debug mode and snippet version does not match editing version
    // if (!isPublishedVersion && kDebugMode) {
    //   return Container(
    //     color: Colors.red.shade50,
    //     padding: EdgeInsets.all(50),
    //     child: snippetWidget,
    //   );
    // }
  }

  Widget _sizedBox(
    Widget snippetWidget,
    bool isPublishedVersion,
    bool changesPending,
  ) {
    return SizedBox(
      width: double.infinity,
      child: Banner(
        message: changesPending
            ? 'changes pending'
            : isPublishedVersion
            ? 'published'
            : 'not published',
        location: BannerLocation.topEnd,
        color: changesPending
            ? Colors.yellow
            : isPublishedVersion
            ? Colors.blue
            : Colors.pink.shade100,
        textStyle: TextStyle(color: Colors.black, fontSize: changesPending ? 8 : 10),
        child:
            // Stack(children: [
            snippetWidget,
        // Align(
        //   alignment: Alignment.topRight,
        //   child: SizedBox(
        //     width: 40,
        //     height: 40,
        //     child: CustomPaint(
        //       size: const Size(40, 40),
        //       painter: TRTriangle(Colors.black),
        //     ),
        //   ),
        // ),
        // ]
        // ),
      ),
    );
  }

  // if root already exists, return it.
  // If not, and a template name supplied, create a named copy of that template.
  // If not, just create a snippet that comprises a PlaceholderNode.
  static Future<SnippetRootNode?> loadSnippetFromCacheOrFromFB({
    required SnippetName snippetName,
  }) async {
    // fco.logger.d("SnippetRootNode.loadSnippetFromCacheOrFromFB");

    SnippetRootNode? rootNode;
    await fco.modelRepo.ensureSnippetInfoCached(snippetName: snippetName);
    SnippetInfoModel? snippetInfo = fco.appInfo.cachedSnippetInfo(snippetName);
    if (snippetInfo != null) {
      // may already be in snippet cache
      rootNode = await snippetInfo.currentVersionFromCacheOrFB();
    }
    String result = '';
    if (rootNode?.isValid() ?? false) {
      result = findUnboundedConstraintIssues(rootNode!);
      if (result != '') {
        print(result);
      }
      return rootNode;
    }
    return null;
  }

  @override
  /// optional clone name, with a default
  SnippetRootNode clone({String? cloneName}) {
    SnippetRootNode copiedNode = super.clone() as SnippetRootNode;
    copiedNode
      ..name = (cloneName ?? '$name-copy')
      // new GlobalKey !
      ..nodeWidgetGK = GlobalKey();
    copiedNode.validateTree();
    return copiedNode;
  }

  @override
  String toString() => FLUTTER_TYPE;

  @override
  Widget? widgetLogo() =>
      Image.asset(fco.asset('lib/assets/images/pub.dev.png'), width: 16);

  static const String FLUTTER_TYPE = "Snippet";
}

// The WidgetType enum helps simplify the analysis logic.
enum WidgetType {
  Flex, // Widgets like Column, Row, Flex
  Scrollable, // Widgets like ListView, SingleChildScrollView, GridView
  Flexible, // Widgets like Expanded, Flexible
  FixedOrBounded, // Widgets like SizedBox, Container with fixed dimensions, Center, Padding
  Other,
}

// Helper function to classify a widget based on common layout behavior.
WidgetType _classifyNode(SNode node) {
  // Check for common Flex widgets (pass constraints along main axis)
  if (node is FlexNode) {
    return WidgetType.Flex;
  }
  // Check for common scrollable widgets (want infinite space on main axis)
  if (node is ListViewNode ||
      node is SingleChildScrollViewNode /* || node is GridViewNode */ ) {
    return WidgetType.Scrollable;
  }
  // Check for widgets that use flex properties (Expanded/Flexible)
  if (node is FlexibleNode) {
    return WidgetType.Flexible;
  }
  // Check for common fixed or bounding widgets (often safe)
  if (node is SizedBoxNode ||
      node is ContainerNode ||
      node is PaddingNode ||
      node is CenterNode) {
    // A sophisticated check would analyze the Container/SizedBox properties,
    // but for simplicity, we treat them as potentially bounding here.
    return WidgetType.FixedOrBounded;
  }
  return WidgetType.Other;
}

// The core algorithm to spot potential unbounded constraint issues.
String findUnboundedConstraintIssues(SnippetRootNode snippet) {
  // Start the recursive check.
  return _checkWidgetNesting(
    snippet,
    isInsideFlex: false,
    isInsideScrollable: false,
  );
}

String _checkWidgetNesting(
  SNode sNode, {
  required bool isInsideFlex,
  required bool isInsideScrollable,
}) {
  final currentType = _classifyNode(sNode);

  // --- Core Unbounded Constraint Rules ---

  // 1. A Scrollable widget inside an unbounded Flex (Column/Row)
  if (currentType == WidgetType.Scrollable &&
      isInsideFlex &&
      !isInsideScrollable) {
    // This often happens when a ListView is a direct child of a Column.
    return "Issue Found: ${sNode.toString()} (Scrollable) is a direct child of an unbounded Flex widget.";
  }

  // 2. An inner Flex widget is a child of an outer Flex and *not* wrapped in Expanded/Flexible
  if (currentType == WidgetType.Flex && isInsideFlex) {
    // This means a Column inside a Column, where the inner one gets infinite height.
    // We check if the widget *itself* is a Flexible, but we can't reliably check
    // its *immediate* parent in this simple recursive model.
    // For a more reliable check, we'd need to check if the parent data is FlexParentData,
    // which is not possible before the build.
    // For this demonstration, we'll assume a Flex inside a Flex is a problem
    // unless it's wrapped in a Flexible/Expanded.
    // Note: The parent data check is what Flutter's runtime does.
    if (sNode is! FlexibleNode) {
      return "Issue Found: Nested Flex widget (${sNode.toString()}) is not wrapped in Expanded/Flexible. It will request infinite space.";
    }
  }

  // 3. Expanded/Flexible used outside of a Flex widget.
  if (currentType == WidgetType.Flexible && !isInsideFlex) {
    return "Issue Found: ${sNode.toString()} can only be used in a Flex (Row/Column).";
  }

  // --- Recurse to children ---

  // Update state for recursion
  final nextIsInsideFlex = isInsideFlex || currentType == WidgetType.Flex;
  final nextIsInsideScrollable =
      isInsideScrollable || currentType == WidgetType.Scrollable;

  // Find children based on common widget properties
  final children = <SNode>[];

  // Single-child widgets
  if (sNode is SC) {
    // Common base class for Container, Center, Padding, etc.
    final child = sNode.child;
    if (child != null) children.add(child);
  } else if (false && sNode is StatelessWidget) {
    // We must call the build method for StatelessWidgets (risky but necessary)
    // In a real static analyzer, you'd analyze the source code, not call build.
    // We *must* skip this for this simplified example to avoid runtime errors,
    // as calling build outside the framework is complex.
  } else if (sNode is MC) {
    // Common base class for Column, Row, Stack, etc.
    children.addAll(sNode.children);
  }

  // Recurse through all found children
  for (final child in children) {
    final issue = _checkWidgetNesting(
      child,
      isInsideFlex: nextIsInsideFlex,
      isInsideScrollable: nextIsInsideScrollable,
    );
    if (issue.isNotEmpty) {
      return issue; // Return the first issue found
    }
  }

  return ""; // No issue found in this branch
}

// --- Example Usage ---
// This requires a mock setup because a real Widget's build method cannot be
// called outside of the Flutter framework. This code demonstrates the logic.

// A common mistake: A ListView inside a Column
final badWidgetTree1 = Column(
  children: <Widget>[
    const Text('Header'),
    ListView.builder(itemBuilder: (context, index) => Text('Item $index')),
  ],
);
// The algorithm would flag: ListView (Scrollable) is a direct child of an unbounded Flex widget.

// A common mistake: A Column inside a Column
final badWidgetTree2 = Column(
  children: <Widget>[
    const Text('Header'),
    Column(
      // Inner Column gets infinite height from outer Column
      children: [Container(height: 50, color: Colors.red)],
    ),
  ],
);
// The algorithm would flag: Nested Flex widget (Column) is not wrapped in Expanded/Flexible.

// A correct, bounded layout
final goodWidgetTree = Column(
  children: <Widget>[
    const Text('Header'),
    Expanded(
      // Expanded bounds the ListView's height
      child: ListView.builder(
        itemBuilder: (context, index) => Text('Item $index'),
      ),
    ),
  ],
);
// The algorithm would flag: "" (No issue)

/*
// To run this in a real Dart environment (outside of Flutter's build context)
// you would need to adjust the logic to use a real static code analyzer
// (like the one built into the Dart/Flutter IDE) which can parse the code's
// abstract syntax tree (AST) instead of relying on the runtime object types.
// The principle remains: check for known problematic widget nesting patterns.
*/
