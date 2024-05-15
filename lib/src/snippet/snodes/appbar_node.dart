import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'appbar_node.mapper.dart';

@MappableClass(discriminatorKey: 'ab')
class AppBarNode extends STreeNode with AppBarNodeMappable {
  int? bgColorValue;
  int? fgColorValue;
  GenericSingleChildNode? leading;
  GenericSingleChildNode? title;
  GenericSingleChildNode? bottom;
  GenericMultiChildNode? actions;

  AppBarNode({
    this.bgColorValue,
    this.fgColorValue,
    this.leading,
    this.title,
    this.bottom,
    this.actions,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) {
    // debugPrint("ContainerNode.properties()...");
    return [
      ColorPropertyValueNode(
        snode: this,
        name: 'bg color',
        tooltip: "The fill color to use for an app bar's Material.",
        colorValue: bgColorValue,
        onColorIntChange: (newValue) => refreshWithUpdate(() => bgColorValue = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
      ColorPropertyValueNode(
        snode: this,
        name: 'fg color',
        tooltip: 'The default color for Text and Icons within the app bar.',
        colorValue: fgColorValue,
        onColorIntChange: (newValue) => refreshWithUpdate(() => fgColorValue = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
    ];
  }

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode); // propagating parents down from root
    possiblyHighlightSelectedNode();
    // find scaffold node
    // add a back button if scaffold has tabs
    SnippetPanelState? spState = SnippetPanel.of(context);
    Widget leadingWidget() {
      if (spState != null) {
        if (spState.prevTabQ.isNotEmpty) {
          return IconButton(
            onPressed: () {
              if (spState.prevTabQ.isNotEmpty) {
                int prev = spState.prevTabQ.removeLast();
                spState.backBtnPressed = true;
                spState.tabC?.index = prev;
                spState.prevTabQSize.value = spState.prevTabQ.length;
                debugPrint("back to tab: $prev,  ${spState.prevTabQ.toString()}");
              }
            },
            icon: const Icon(Icons.arrow_back),
          );
        } else {
          return const Offstage();
        }
      } else {
        return const Offstage();
      }
    }

    var bottomWidget = bottom?.toWidgetProperty(context, this);
    var actionWidgets = actions?.toWidgetProperty(context, this);
    var titleWidget = title?.toWidgetProperty(context, this);

    try {
      return AppBar(
        key: createNodeGK(),
        leading: ListenableBuilder(listenable: spState!.prevTabQSize, builder: (_, __) => leadingWidget()),
        title: titleWidget,
        bottom: bottomWidget as PreferredSizeWidget,
        actions: actionWidgets,
        backgroundColor: bgColorValue != null ? Color(bgColorValue!) : null,
        foregroundColor: fgColorValue != null ? Color(fgColorValue!) : null,
      );
    } catch (e) {
      debugPrint('AppBarNode.toWidget() failed!');
      return Material(
        textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Icon(Icons.error, color: Colors.redAccent),
              hspacer(10),
              Useful.coloredText(e.toString()),
            ],
          ),
        ),
      );
    }
  }

  @override
  bool canBeDeleted() => (leading == null && title == null && bottom == null && actions == null);

  @override
  List<Widget> menuAnchorWidgets_WrapWith(NodeAction action, bool? skipHeading) {
    return [
      if (getParent() is! ScaffoldNode) ...super.menuAnchorWidgets_Heading(action),
      if (getParent() is! ScaffoldNode) menuItemButton("Scaffold", ScaffoldNode, action),
    ];
  }

  @override
  List<Type> replaceWithOnly() => [AppBarNode];

  @override
  List<Type> wrapCandidates() => [ScaffoldNode];

  @override
  List<Type> wrapWithOnly() => [ScaffoldNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "AppBar";
}
