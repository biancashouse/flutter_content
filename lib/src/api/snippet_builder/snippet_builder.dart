// ignore_for_file: camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';

// import 'package:flutter_content/src/api/snippet_builder/context_extension.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'versions_menu_anchor_with_edit_menu_item.dart'
    show SnippetMenuAnchor, AnchorWidgetEnum;

const BODY_PLACEHOLDER = 'body-placeholder';

class SnippetBuilder extends StatefulWidget {
  // final String? panelName;

  // from canned snippet
  final String? snippetName;

  // or by providing tree of nodes
  final SnippetRootNode? templateSnippet;

  final Map<String, void Function(BuildContext)>? handlers;

  final bool justPlaying;

  final TargetModel? tc; // for when called to create a hotspot callout

  final void Function(ScrollNotification)? onScrollF;

  final VoidCallback? onLayoutDone;

  const SnippetBuilder({
    this.snippetName,
    this.templateSnippet,
    this.handlers,
    this.onScrollF,
    this.justPlaying = false,
    this.tc,
    this.onLayoutDone,
    super.key,
  });

  static SnippetBuilderState? of(BuildContext context) =>
      context.findAncestorStateOfType<SnippetBuilderState>();

  @override
  State<SnippetBuilder> createState() => SnippetBuilderState();

  // static SnippetRootNode createSnippetFromTemplateNodes(SnippetRootNode rootNode, String snippetName) {
  //   rootNode.validateTree();
  //   rootNode.name = snippetName;
  //   return rootNode;
  // }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('sName', snippetName, defaultValue: ''));
  }
}

class SnippetBuilderState extends State<SnippetBuilder>
    with TickerProviderStateMixin {
  Map<String, TabBarNode> tabBars = {};

  // will be supplied directly as snippetName arg or supplied via the template
  String snippetName() {
    final name = widget.snippetName ?? widget.templateSnippet?.name;
    if (name == null || name.isEmpty) {
      throw Exception('SnippetBuilderState.snippetName() is null!');
    }
    return name;
  }

  // ZoomerState? get parentTSState => Zoomer.of(context);

  // int countTabs() {
  //   SnippetRootNode? rootNode = FCO.capiBloc.state.rootNode("root");
  //   if (rootNode == null) return 0;
  //   TabBarNode? tabBarNode = FCO.capiBloc.state.snippetBeingEdited?.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
  //   return tabBarNode?.children.length ?? 0;
  // }

  @override
  void initState() {
    super.initState();

    widget.handlers?.forEach((key, value) {
      fco.registerHandler(key, value);
      fco.logger.i("registered handler '$key'");
    });

    // removed snippet place naming functionality - use tab bar instead
    // if (widget.panelName != null &&
    //     !fco.placeNames.contains(widget.panelName)) {
    //   fco.placeNames.add(widget.panelName!);
    // }
  }

  // removed snippet place naming functionality - use tab bar instead
  // @override
  // void dispose() {
  //   if (widget.panelName != null && fco.placeNames.contains(widget.panelName)) {
  //     fco.placeNames.remove(widget.panelName!);
  //   }
  //   super.dispose();
  // }

  bool get pageIsEditable => EditablePage.of(context) != null;

  CAPIBloC get bloc => context.read<CAPIBloC>();

  @override
  Widget build(BuildContext context) {
    // bool nodeTreeSupplied = widget.rootNode != null;
    // if (nodeTreeSupplied) {
    //   SnippetRootNode newSnippet = SnippetPanel.createSnippetFromTemplateNodes(
    //     widget.rootNode!,
    //     widget.rootNode!.name,
    //   );
    // }

    // panel name is always supplied, but snippet name can be omitted,
    // in which case a default snippet name is used: Snippet[pName].
    // But first, see if there's an entry in the placement map, in which case we use that snippet name.
    // if (FCO.snippetPlacementMap.containsKey(widget.panelName)) {
    //   snippetNameToUse = FCO.snippetPlacementMap[widget.panelName]!;
    // }

    // SnippetInfoModel.debug();

    // if a snippet passed in, don't need a futurebuilder
    // return BlocConsumer<CAPIBloC, CAPIState>(
    //   // key: widget.panelName != null
    //   //     ? fco.panelGkMap[widget.panelName!] = GlobalKey(
    //   //         debugLabel: 'Panel[${widget.panelName}]',
    //   //       )
    //   //     : null,
    //   //
    //   // show tappable overlays if state variable set with this snippet's name
    //   listenWhen: (context, state) {
    //     if (!fco.inSelectWidgetMode) return false;
    //     var name = snippetName();
    //     bool thisSnippetIsInWidgetSelectionMode =
    //         state.snippetNameShowingTappableOverlaysFor == name;
    //     print(
    //       'listening for thisSnippetIsInWidgetSelectionMode on $name - returning $thisSnippetIsInWidgetSelectionMode',
    //     );
    //     return thisSnippetIsInWidgetSelectionMode;
    //   },
    //   listener: (realContext, state) {
    //     // allow some time for rendering - seems too hacky, but works!
    //     // fco.afterMsDelayDo(1500, (){
    //     //   var snippetInfo = SnippetInfoModel.cachedSnippetInfo(snippetName());
    //     //   var snippetChild = snippetInfo?.currentVersionFromCache()?.child;
    //     //   // print('root node for tappable overlays is a ${snippetChild.toString()}');
    //     //   if (fco.anyPresent(['quill-te', 'uml-te', 'markdown-te'])) return;
    //     //   var ctx = snippetChild?.nodeWidgetGK?.currentContext;
    //     //   // print('currentContext is $ctx');
    //     //   ctx?.showSnippetNodeWidgetTappableOverlays(widget.scName);
    //     // });
    //     // showSnippetNodeWidgetTappableOverlays(context, widget.scName);
    //     // if (state.snippetBeingEdited?.aNodeIsSelected ?? false) {
    //     //   final selectedNode = state.snippetBeingEdited!.selectedNode;
    //     //     Rect? borderRect = selectedNode!.calcBborderRect();
    //     //     if (borderRect != null) {
    //     //       selectedNode.showNodeWidgetOverlay(borderRect: widget. followScroll: false);
    //     //     }
    //     // }
    //   },
    //   buildWhen: (previous, current) {
    //     // fco.logger.i(
    //     //     'BlocBuilder - current.onlyTargetsWrappers: ${current.onlyTargetsWrappers}');
    //     return !current.onlyTargetsWrappers && fco.notInSelectWidgetMode;
    //   },
    //   builder: (blocContext, state) {
    //     fco.logger.d('\nSnippetPanel builder:\n');
    //
    return BlocBuilder<CAPIBloC, CAPIState>(
      buildWhen: (previous, current) {
        bool result =
            (!current.onlyTargetsWrappers
            //     &&
            // previous.snippetNameShowingTappableOverlaysFor !=
            //     current.snippetNameShowingTappableOverlaysFor
            );
        // print('buildWhen is $result');
        return result;
      },
      builder: (context, state) {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              // print(
              //   "A descendant widget scrolled to: ${notification.metrics.pixels}",
              // );
              widget.onScrollF?.call(notification);
              // if (fco.inNodeSelectionMode) {
              // Schedule the callback, but DO NOT pass the stale state into it.
              // fco.afterNextBuildDo(() {
              // Inside the callback, use the BuildContext to get the
              // LATEST state from the BLoC. The `context` here is from
              // the BlocBuilder's builder method and is always current.
              // Why This Works
              //   - context.read<CAPIBloC>().state: The context passed
              //   to the BlocBuilder's builder is "live" and is aware
              //   of its position in the widget tree. When you call
              //   context.read<T>(), it walks up the tree to find the
              //   nearest provider of type T (in this case, your CapiBloc)
              //   and gives you access to it.
              //   - Post-Build Accuracy: Because your afterNextBuildDo
              //   callback runs after the build cycle, when you call
              //   context.read<CAPIBloC>().state at that moment, you are
              //   guaranteed to receive the most up-to-date state object
              //   that was just used for the completed build.
              //
              // This pattern of fetching fresh state from the BuildContext
              // inside a post-frame callback is the standard and correct
              // way to avoid race conditions and stale state issues in
              // Flutter when dealing with asynchronous UI updates.
              // final CAPIBloC bloc = context.read<CAPIBloC>();
              // final CAPIState currentState = bloc.state;
              // TODO populateNodeBorderRects(snippetName());
              // });
              // return true;
              // }
            }
            // Return `true` to consume the notification and stop it from bubbling further up.
            // Return `false` to let it continue bubbling.
            return false;
          },
          child: Builder(
            builder: (context) {
              // optimise by first checking whether already in memory
              // can avoid unnecessary futurebuilder
              var appInfo = fco.appInfo;
              bool snippetExists = appInfo.snippetNames.contains(snippetName());
              // must supply a template when if snippet does not exist
              if (!snippetExists && widget.templateSnippet == null) {
                return _stackWidget(
                  SnippetRootNode(
                    name: snippetName(),
                    child: TextNode(
                      text: 'Must supply a template for a new snippet!',
                      tsPropGroup: TextStyleProperties(),
                    ),
                  ),
                );
              }
              if (!snippetExists) {
                // SNIPPET DOES NOT YET EXIST - use template to create
                // first version as a clone of the template
                fco.pageList.add(widget.templateSnippet!.name);
                VersionId newVersionId = SnippetInfoModel.createNewVersion(
                  widget.templateSnippet!,
                );
                print(
                  'SnippetBuilder() created a brand new snippet from a template (${widget.templateSnippet!.name}',
                );
                fco.modelRepo.saveSnippetVersion(
                  snippetName: widget.templateSnippet!.name,
                  newVersionId: newVersionId,
                  newVersion: widget.templateSnippet!,
                );
                fco.modelRepo.saveAppInfo();
                return _stackWidget(widget.templateSnippet!);
              }

              // ALREADY EXIST - SNIPPET MAY BE IN CACHE (avoid Future)
              SnippetInfoModel? snippetInfo =
                  SnippetInfoModel.cachedSnippetInfo(snippetName());
              if (snippetInfo != null) {
                // SNIPPET EXISTS, TRY TO GET FROM SNIPPET CACHE
                // A SNIPPET INFO ALWAYS HAS AT LEAST 1 VERSION
                SnippetRootNode? snippet = snippetInfo
                    .currentVersionFromCache();
                if (snippet != null) {
                  return _stackWidget(snippet);
                }
              }

              // EXISTS, BUT NOT PRESENT IN CACHE, so go fetch...
              return FutureBuilder<SnippetRootNode?>(
                future: SnippetRootNode.loadSnippetFromCacheOrFromFB(
                  snippetName: snippetName(),
                ),
                builder: (futureContext, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // SnippetInfoModel.debug();
                  // SnippetInfoModel? snippetInfo = SnippetInfoModel.snippetInfoCache[snippetName()];
                  // SnippetInfoModel.debug();

                  if (snapshot.data == null) {
                    return Error(
                      "SnippetBuilder",
                      color: Colors.red,
                      size: 18,
                      errorMsg: "${snippetName()}: ${snapshot.error.toString()}",
                      key: GlobalKey(),
                    );
                  }

                  SnippetRootNode snippet = snapshot.data!;

                  return _stackWidget(snippet);
                },
              );
            },
          ),
        );
      },
    );
    //   },
    // );
  }

  Widget _stackWidget(SnippetRootNode snippet) {
    // triggers AFTER layout of this widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onLayoutDone?.call();
    });

    late List<Widget> stackChildren;

    try {
      stackChildren = [snippet.buildFlutterWidget(context, null)];
    } catch (e) {
      stackChildren = [Icon(Icons.error, size: 40, color: Colors.purpleAccent)];
    }

    SnippetInfoModel snippetInfo = SnippetInfoModel.cachedSnippetInfo(
      snippetName(),
    )!;

    bool isPublishedVersion = fco.isEditingVersionPublished(snippetName());

    Color triangleColor = Colors.purpleAccent; // in edit mode
    if (!isPublishedVersion) triangleColor = Colors.deepOrange;

    // orange indicator when not signed in and
    // showing an unpublished snippet
    if (!widget.justPlaying && !isPublishedVersion && !fco.canEditContent()) {
      stackChildren.add(
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.deepOrange,
            height: 6,
            width: double.infinity,
          ),
        ),
      );
    }

    // show menu anchor if signed in and not selecting a
    // widget not editing a snippety
    if (fco.canEditContent() &&
        bloc.dontShowTappableBorderRects() &&
        bloc.aSnippetIsNotBeingEdited()) {
      stackChildren.add(
        Align(
          alignment: Alignment.topRight,
          child: PointerInterceptor(
            child: SnippetMenuAnchor(
              this,
              anchorWidget: AnchorWidgetEnum.Triangle,
              triangleColor: triangleColor,
              snippetInfo: snippetInfo,
            ),
          ),
        ),
      );
    }

    // show menu anchor for a hotspot's content
    // cId as a number means it's a hotspot content callout
    if (!widget.justPlaying &&
        fco.canEditContent() &&
        bloc.dontShowTappableBorderRects() &&
        bloc.aSnippetIsNotBeingEdited() &&
        pageIsEditable &&
        SnippetRootNode.isHotspotCalloutContent(snippetName())) {
      stackChildren.add(
        Align(
          alignment: Alignment.topRight,
          child: PointerInterceptor(
            child: Tooltip(
              message: 'show Snippet menu\n${snippetInfo.name}',
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.topRight,
                child: SnippetMenuAnchor(
                  this,
                  anchorWidget: AnchorWidgetEnum.IconButton,
                  snippetInfo: snippetInfo,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Stack(children: stackChildren);
  }

  // void _tappedTriangle(bool isCID) {
  //   if ((!pageIsEditable && !isCID) || fco.snippetBeingEdited != null) {
  //     return;
  //   }
  //
  //   fco.capiBloc.add(CAPIEvent.enterSelectWidgetMode(snippetName: widget.snippetName ?? widget.snippetRootNode!.name));
  // }

  // _renderSnippet(context) {
  //   return FutureBuilder<void>(
  //
  //     future: SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(snippetName: snippetName()),
  //     builder: (futureContext, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         Widget snippetWidget;
  //         try {
  //           // in case did a revert, ignore snapshot data and use the AppInfo instead
  //           SnippetRootNode? snippet = FCO.currentSnippet(snippetName());
  //           snippet?.validateTree();
  //           // SnippetRootNode? snippetRoot = cache?[editingVersionId];
  //           snippetWidget =
  //               snippet == null ? const Icon(Icons.error, color: Colors.redAccent) : snippet.child?.toWidget(futureContext, snippet) ?? const Placeholder();
  //         } catch (e) {
  //           fco.logger.i('snippetRootNode.toWidget() failed!');
  //           snippetWidget = Material(
  //             textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
  //             child: SingleChildScrollView(
  //               scrollDirection: Axis.horizontal,
  //               child: Row(
  //                 children: [
  //                   const Icon(Icons.error, color: Colors.redAccent),
  //                   Gap(10),
  //                   FCO.coloredText(e.toString()),
  //                 ],
  //               ),
  //             ),
  //           );
  //         }
  //         return snippetWidget;
  //       } else {
  //         return const Center(child: CircularProgressIndicator());
  //       }
  //     });
  // }
}
