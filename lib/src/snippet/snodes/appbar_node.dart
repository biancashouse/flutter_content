import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:gap/gap.dart';

part 'appbar_node.mapper.dart';

@MappableClass(discriminatorKey: 'ab')
class AppBarNode extends STreeNode with AppBarNodeMappable {
  int? bgColorValue;
  int? fgColorValue;
  double? height;
  GenericSingleChildNode? leading;
  GenericSingleChildNode? title;
  GenericSingleChildNode? bottom;
  GenericMultiChildNode? actions;

  AppBarNode({
    this.bgColorValue,
    this.fgColorValue,
    this.height,
    this.leading,
    this.title,
    this.bottom,
    this.actions,
  });

  @override
  List<PTreeNode> properties(BuildContext context) {
    // fco.logi("ContainerNode.properties()...");
    return [
      DecimalPropertyValueNode(
        snode: this,
        name: 'height',
        decimalValue: height,
        onDoubleChange: (newValue) => refreshWithUpdate(() => height = newValue),
        calloutButtonSize: const Size(90, 20),
      ),
      ColorPropertyValueNode(
        snode: this,
        name: 'bg color',
        tooltip: "The fill color to use for an app bar's Material.",
        colorValue: bgColorValue,
        onColorIntChange: (newValue) =>
            refreshWithUpdate(() => bgColorValue = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
      ColorPropertyValueNode(
        snode: this,
        name: 'fg color',
        tooltip: 'The default color for Text and Icons within the app bar.',
        colorValue: fgColorValue,
        onColorIntChange: (newValue) =>
            refreshWithUpdate(() => fgColorValue = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
    ];
  }

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    try {
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
                      fco.logi("back to tab: $prev,  ${spState.prevTabQ.toString()}");
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
      if (bottomWidget is! PreferredSizeWidget?) {
            fco.logi("Oops.");
          }
      var actionWidgets = actions?.toWidgetProperty(context, this);
      var titleWidget = title?.toWidgetProperty(context, this);

      try {
            var appBar = AppBar(
              key: createNodeGK(),
              leading: leading != null
                  ? ListenableBuilder(
                  listenable: spState!.prevTabQSize,
                  builder: (_, __) => leadingWidget())
                  : null,
              title: titleWidget,
              toolbarHeight: height,
              bottom: bottomWidget as PreferredSizeWidget?,
              actions: actionWidgets,
              backgroundColor: bgColorValue != null ? Color(bgColorValue!) : null,
              foregroundColor: fgColorValue != null ? Color(fgColorValue!) : null,
            );
            return height != null
                ? PreferredSize(preferredSize: Size.fromHeight(height!), child: appBar)
                : appBar;
          } catch (e) {
            fco.logi('AppBarNode.toWidget() failed!');
            return Material(
              textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Icon(Icons.error, color:Colors.red),
                    const Gap(10),
                    fco.coloredText(e.toString()),
                  ],
                ),
              ),
            );
          }
    } catch (e) {
      return Error(key: createNodeGK(), FLUTTER_TYPE, color: Colors.red, size: 32, errorMsg: e.toString());
    }
  }

  @override
  bool canBeDeleted() =>
      (leading == null && title == null && bottom == null && actions == null);

  @override
  List<Widget> menuAnchorWidgets_WrapWith(VoidCallback enterEditModeF, exitEditModeF,
      NodeAction action, bool? skipHeading) {
    return [
      if (getParent() is! ScaffoldNode)
        ...super.menuAnchorWidgets_Heading(action),
      if (getParent() is! ScaffoldNode)
        menuItemButton(enterEditModeF, exitEditModeF,"Scaffold", ScaffoldNode, action),
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
