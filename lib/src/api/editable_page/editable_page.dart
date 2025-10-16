import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/editable_page/snippet_properties_tree_view.dart';
import 'package:flutter_content/src/api/editable_page/snippet_tree_view.dart';
import 'package:flutter_content/src/api/editable_page/versions_menu_anchor.dart';

import 'package:flutter_content/src/bloc/snippet_being_edited.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_split_view/multi_split_view.dart';

class EditablePage extends StatefulWidget {
  final RoutePath routePath;
  final Widget child;

  // final bool provideNamedScrollController;

  const EditablePage({
    required this.routePath,
    required this.child,
    // this.provideNamedScrollController = false,
    // this.dontShowLockIcon = false,
    required super.key, // provides access to state later - see initState and fco.pageGKs
  });

  // allow a page widget to find its parent EditablePage
  static EditablePageState? of(BuildContext context) => context.mounted
      ? context.findAncestorStateOfType<EditablePageState>()
      : null;

  static NamedScrollController? maybeScrollController(BuildContext context) =>
      of(context)?.namedSC;

  static String? maybeScrollControllerName(BuildContext context) =>
      maybeScrollController(context)?.name;

  // static ScrollController? ancestorSc(BuildContext context, Axis? axis) {
  //   ScrollableState? scrollableState = Scrollable.maybeOf(context, axis: axis);
  //   return scrollableState?.widget.controller;
  // }

  @override
  State<EditablePage> createState() => EditablePageState();
}

class EditablePageState extends State<EditablePage> {
  late MultiSplitViewController msvC;
  late NamedScrollController namedSC;
  final kDividerThickness = 20.0;
  double sNodeTreeAreaMaxWidth = 0; // LayoutBuilder will update it
  double pNodeTreeAreaMaxWidth = 0; // LayoutBuilder will update it

  SnippetBeingEdited? get snippetBeingEdited => fco.snippetBeingEdited;

  SNode? get selectedNode => fco.selectedNode;

  @override
  void initState() {
    print("EditablePage initState (${widget.routePath})");
    super.initState();

    msvC = MultiSplitViewController();
    namedSC = NamedScrollController(widget.routePath, Axis.vertical);

    // fco.pageGKs[widget.routePath] = widget.key as GlobalKey;
    fco.currentEditablePagePath = widget.routePath;

    // fco.afterNextBuildDo(() {
    //   setState(() {
    //     fabPosition = Offset(fco.scrW - 90, 10); // Initial position of the FAB
    //   });
    // });
  }

  // ScrollControllerName? scName(ctx) => EditablePage.name(ctx);
  //
  // NamedScrollController? sC(ctx) => scName(ctx) != null
  //   ? NamedScrollController(scName(ctx)!, Axis.vertical)
  //   : null;

  @override
  void dispose() {
    if (!mounted) return;
    namedSC.dispose(); // Dispose of the ScrollController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CAPIBloC, CAPIState>(
      // buildWhen: (previous, current) {
      //   return true || current.isSignedIn != current.isSignedIn;
      // },
      builder: (context, state) {
        bool isGuest = !fco.canEditContent();
        return isGuest
            ? buildWhenNotSignedIn(context)
            : buildWhenSignedIn(context);
      },
    );
  }

  Widget buildWhenNotSignedIn(BuildContext context) => _guestPage();

  Widget buildWhenSignedIn(BuildContext context) {
    print('EditablePageState.buildWhenSignedIn ${widget.routePath}');
    return BlocConsumer<CAPIBloC, CAPIState>(
      listenWhen: (context, state) => fco.aNodeIsSelected,
      listener: (context, state) {
        // update selection widget overlay
        // skip if currently editing a markdown, quill, or uml
        if (fco.anyPresent(['quill-te', 'uml-te', 'markdown-te'])) return;
        fco.dismissAll();
        fco.afterNextBuildDo(() {
          fco.afterNextBuildDo(() {
            final selectedNode = state.snippetBeingEdited!.selectedNode;
            if (mounted) {
              Rect? borderRect = selectedNode!.calcBorderRect();
              if (borderRect != null) {
                selectedNode.showSelectedNonTappableNodeWidgetOverlay(
                  // selected: true,
                  borderRect: borderRect,
                  scName: namedSC.name,
                );
              }
            }
            fco.afterNextBuildDo(() {
              // force an extra build to ensure sNodeTreeAreaMaxWidth set
              setState(() {});
            });
          });
        });
      },
      buildWhen: (previous, current) {
        // bool  nodeChanged = current.snippetBeingEdited != previous.snippetBeingEdited;
        // bool selectionChanged = current.snippetBeingEdited?.selectedNode !=
        //     previous.snippetBeingEdited?.selectedNode;
        // return true || nodeChanged || selectionChanged;
        return !current.onlyTargetsWrappers
        // && current.snippetNameShowingTappableOverlaysFor == null
        ;
      },
      builder: (context, state) => _signedInPage(),
    );
  }

  Widget _signedInPage() {
    bool showSNodeTree() =>
        snippetBeingEdited != null; // && fco.selectedNode is! MarkdownNode;
    bool showPropertiesPane() =>
        snippetBeingEdited != null &&
        selectedNode?.pTreeC != null; //&& fco.selectedNode is! MarkdownNode;

    // set up areas
    List<Area> areas = [];
    if (showSNodeTree()) {
      // double flex = (fco.selectedNode is MarkdownNode) ? 0 : 1;
      areas.add(
        Area(
          builder: (ctx, area) => LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              sNodeTreeAreaMaxWidth = constraints.maxWidth;
              return _sNodeTreeArea();
            },
          ),
          flex: 1,
        ),
      );
    }
    if (showPropertiesPane()) {
      areas.add(
        Area(
          builder: (ctx, area) => LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              pNodeTreeAreaMaxWidth = constraints.maxWidth;
              return _propertiesPanel();
            },
          ),
          flex: 1,
        ),
      );
    }
    areas.add(
      Area(
        builder: (ctx, area) => _pageContentArea(ctx),
        // {
        //   return fco.snippetBeingEdited == null
        //       ? _pageContentArea()
        //       : PointerInterceptor(child: _pageContentArea());
        // },
        flex: 2,
      ),
    );

    msvC.areas = areas;

    // 2 layouts: 1) property tree on right of content area, 2) hidden snode tree, single property above content area
    var msvt = MultiSplitViewTheme(
      data: MultiSplitViewThemeData(
        dividerThickness: kDividerThickness,
        dividerPainter: DividerPainters.grooved1(
          backgroundColor: Colors.purple,
          color: Colors.indigo[100]!,
          highlightedColor: Colors.indigo[900]!,
        ),
      ),
      child: MultiSplitView(
        controller: msvC,
        axis: Axis.horizontal,
        initialAreas: areas,
        onDividerDragStart: (_) {
          dismissAllNodeWidgetOverlays();
        },
        onDividerDragEnd: (_) {
          final rootNode = fco.selectedNode?.rootNodeOfSnippet();
          if (rootNode != null) {
            assert(rootNode.isValid());
            fco.saveNewVersion(snippet: rootNode);
            // refreshSelectedNodeWidgetBorderOverlay(rootNode.name);
            // showNodeWidgetOverlays();
          }
        },
      ),
    );

    //
    return Center(child: msvt);
  }

  Widget _guestPage() {
    GlobalKey zoomerGk = GlobalKey();

    Widget builtWidget = Material(
      animateColor: true,
      child: Stack(
        fit: StackFit.loose,
        children: [
          // normal user view, wrapped in a Zoomer
          Zoomer(key: zoomerGk, child: widget.child),
          // show pencil signin icon button
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: fco.canEditContent() ? 68 : 8.0),
              child: fco.NavigationDD(pencilIconColor: Colors.red),
            ),
          ),
        ],
      ),
    );

    return fco.isAndroid
        ? fco.androidAwareBuild(context, builtWidget)
        : builtWidget;
  }

  Widget _pageContentArea(content) {
    GlobalKey zoomerGk = GlobalKey();

    // set widgetToShow when in select widget mode
    Widget? widgetToShow;
    if (fco.inSelectWidgetMode) {
      SnippetName snippetName = fco.capiBloc.state.showOnlySnippet!;
      SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
        snippetName,
      );
      widgetToShow = snippetInfo?.currentVersionFromCache()?.buildFlutterWidget(
        context,
        null,
      );
    }

    final aSnippetIsBeingEdited = fco.snippetBeingEdited != null;
    // final possiblyACalloutContentId = fco.snippetBeingEdited
    //     ?.getRootNode()
    //     .name;
    // final editingACalloutContentSnippet =
    //     possiblyACalloutContentId != null &&
    //     SnippetRootNode.isHotspotCalloutContent(possiblyACalloutContentId);

    Widget builtWidget = NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (SizeChangedLayoutNotification notification) {
        // fco.logger.i("FlutterContentApp SizeChangedLayoutNotification}");
        // fco.dismissAll(exceptFeatures: ["FAB"]);
        // refresh tappables
        fco.afterMsDelayDo(300, () {
          // FCO.refreshMQ(context);
          if (fco.inSelectWidgetMode) {
            // EditablePage.removeAllTappableNodeWidgetOverlays();
            fco.dismissAll();
            // show a barrier for any parts of page not being edited
            // showNodeWidgetOverlays();
            // protect iFrames and PlatformViews with an overlay having PointerInterceptor
            // showNodeWidgetOverlays();
            // fco.afterNextBuildDo(() {});
          }
        });
        return true;
      },
      child: SizeChangedLayoutNotifier(
        child: GestureDetector(
          onTap: () {
            // exitEditMode();
            fco.capiBloc.add(CAPIEvent.exitSelectWidgetMode());
            // fco.afterNextBuildDo(() {
            //   fco.afterMsDelayDo(1000, () {
            //     showNodeWidgetOverlays();
            //   });
            // });
          },
          child: Material(
            animateColor: true,
            child: Stack(
              fit: StackFit.loose,
              children: [
                if (aSnippetIsBeingEdited)
                  // show just that snippet
                  Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.purple,
                      title: fco.coloredText("preview", color: Colors.white),
                    ),
                    body: SnippetBuilder.fromNodes(
                      // panelName: 'demo-buttons',
                      snippetRootNode: snippetBeingEdited!.getRootNode(),
                      // snippetRootNode: SnippetRootNode(
                      //   name: 'we-create-flutter-apps-and-packages',
                      //   child: PlaceholderNode()
                      // ),
                      scName: null, //sC.name, because no scrolling used
                    ),
                  ),
                if (!aSnippetIsBeingEdited)
                  // normal user view, wrapped in a Zoomer
                  Zoomer(
                    key: zoomerGk,
                    child: widgetToShow ?? widget.child,
                    // child: BlocBuilder<CAPIBloC, CAPIState>(
                    //     builder: (blocContext, state) {
                    //   return widget.child;
                    // }),
                  ),
                if (aSnippetIsBeingEdited &&
                    fco.selectedNode != null &&
                    mounted)
                  // show a cutout barrier for selected snode
                  ModalBarrierWithCutout(
                    cutoutRect:
                        (fco.selectedNode?.calcBorderRect() ?? Rect.zero)
                            .translate(
                              -sNodeTreeAreaMaxWidth -
                                  pNodeTreeAreaMaxWidth -
                                  kDividerThickness * 2,
                              0,
                            ),
                    color: Colors.purple,
                    opacity: .75,
                  ),
                if (!aSnippetIsBeingEdited)
                  // show pencil signin icon button
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: fco.canEditContent() ? 68 : 8.0,
                      ),
                      child: fco.NavigationDD(pencilIconColor: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
          // ),
        ),
      ),
    );

    return fco.isAndroid
        ? fco.androidAwareBuild(context, builtWidget)
        : builtWidget;
  }

  Widget _sNodeTreeArea() {
    SNode? rootNode = snippetBeingEdited?.treeC.roots.first.rootNodeOfSnippet();
    if (rootNode is SnippetRootNode) {
      SnippetName snippetName = rootNode.name;
      SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
        snippetName,
      );
      if (snippetInfo != null) {
        // String title =
        //     fco.snippetBeingEdited?.getRootNode().name ??
        //         'snippet name?';
        //snippetBeingEdited?.treeC.rebuild();
        return GestureDetector(
          onTap: () {
            fco.dismissAll();
            // if showing markdown editor callout, just dismiss it, but don't remove node selection
            // if (fco.anyPresent(['md-te'])) {
            //   fco.dismiss('md-te');
            //   return;
            // }
            fco.capiBloc.add(CAPIEvent.clearNodeSelection());
            // removeAllNodeWidgetOverlays();
            // fco.afterMsDelayDo(1000, () {
            //   showNodeWidgetOverlays();
            // });
            fco.hide("floating-clipboard");
          },
          child: Material(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.purple,
                title: fco.coloredText("Snippet", color: Colors.white),
                centerTitle: true, // Add this line
                actions: [
                  IconButton(
                    hoverColor: Colors.white30,
                    onPressed: () async {
                      CAPIState capiState = fco.capiBloc.state;
                      if (!snippetInfo.isFirstVersion()) {
                        VersionId? prevId = snippetInfo.previousVersionId();
                        revertToVersion(prevId, snippetInfo, capiState);
                      }
                    },
                    icon: Icon(
                      Icons.undo,
                      color:
                          !snippetInfo
                              .isFirstVersion() //|| fco.capiBloc.canUndo
                          ? Colors.white
                          : Colors.white54,
                    ),
                    tooltip: 'previous version',
                  ),
                  IconButton(
                    hoverColor: Colors.white30,
                    onPressed: () {
                      CAPIState capiState = fco.capiBloc.state;
                      if (!snippetInfo.isLatestVersion()) {
                        VersionId? nextId = snippetInfo.nextVersionId();
                        revertToVersion(nextId, snippetInfo, capiState);
                      }
                    },
                    icon: Icon(
                      Icons.redo,
                      color:
                          !snippetInfo
                              .isLatestVersion() //|| fco.capiBloc.canRedo
                          ? Colors.white
                          : Colors.white54,
                    ),
                    tooltip: 'next version',
                  ),
                  IconButton(
                    hoverColor: Colors.white30,
                    onPressed: () async {},
                    icon: VersionsMenuAnchor(snippetInfo: snippetInfo),
                  ),
                  IconButton(
                    onPressed: () {
                      // SNode.unhighlightSelectedNode();
                      // if was editing a callout content snippet, dismiss all callouts
                      if (SnippetRootNode.isHotspotCalloutContent(
                        snippetName,
                      )) {
                        fco.dismissAll();
                      } else {
                        dismissAllNodeWidgetOverlays();
                        // fco.dismissAll(exceptFeatures: [CalloutConfigToolbar.CID]);
                        fco.unhide(CalloutConfigToolbar.CID);
                        fco.appInfo.hideClipboard();
                      }
                      fco.capiBloc.add(const CAPIEvent.popSnippetEditor());
                      // fco.afterNextBuildDo(() {
                      //   NamedScrollController.restoreOffset(scName);
                      // });
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              body: Material(
                color: Colors.purple.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: InteractiveViewer(
                    transformationController: fco.snippetTreeTC,
                    // trackpadScrollCausesScale: true,
                    alignment: Alignment.topLeft,
                    constrained: false,
                    // onInteractionStart: (_) => snippetBloc.add(const CAPIEvent.clearNodeSelection()),
                    // onInteractionEnd: (_) => snippetBloc.add(const CAPIEvent.clearNodeSelection()),
                    child: SizedBox(
                      width: 700,
                      height: 1200,
                      child: Builder(
                        builder: (context) {
                          // fco.logger.i('SnippetTreeView...');
                          return SnippetTreeView(scName: namedSC.name);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              // SnippetTreePane(snippetInfo, widget.routePath),
            ),
          ),
        );
      }
      return const Offstage();
    } else {
      return const Offstage();
    }
  }

  Widget _propertiesPanel() {
    bool showingProperties = fco.aNodeIsSelected;
    ScrollController? propertiesPaneSC = selectedNode?.propertiesPaneSC();
    PNodeTreeController? pTreeC = selectedNode?.pTreeC(context, {});
    // pTreeC!.collapseAll();
    return !showingProperties || propertiesPaneSC == null
        ? const Offstage()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: fco.coloredText(
                "Properties (selected node)",
                color: Colors.white,
              ),
            ),
            body: Material(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InteractiveViewer(
                  transformationController: fco.propertiesTreeTC,
                  alignment: Alignment.topLeft,
                  constrained: false,
                  child: SizedBox(
                    width: 330,
                    height: 1000,
                    child: PropertiesTreeView(
                      treeC: pTreeC!,
                      sNode: selectedNode!,
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  // only called with MaterialAppWrapper context
  // void showNodeWidgetOverlays() {
  //   return;
  //   void traverseAndMeasure(BuildContext el) {
  //     if ((fco.nodesByGK.containsKey(el.widget.key))) {
  //       GlobalKey gk = el.widget.key as GlobalKey;
  //       SNode? node = fco.nodesByGK[gk];
  //       if (node != null) {
  //         Rect? r = gk.globalPaintBounds(
  //           skipWidthConstraintWarning: true,
  //           skipHeightConstraintWarning: true,
  //         );
  //         if (r != null) {
  //           r = fco.restrictRectToScreen(r);
  //           if (fco.inSelectWidgetMode &&
  //                   node.canShowTappableNodeWidgetOverlay ||
  //               node.isHtmlElementViewOrPlatformView()) {
  //             node.showTappableNodeWidgetOverlay(
  //               context,
  //               // whiteBarrier: overlayWithABarrier,
  //               scName: widget.routePath,
  //             );
  //           }
  //         }
  //       }
  //     }
  //
  //     el.visitChildElements((innerEl) {
  //       traverseAndMeasure(innerEl);
  //     });
  //   }
  //
  //   dismissAllNodeWidgetOverlays();
  //
  //   var pageContext = context;
  //   traverseAndMeasure(pageContext);
  //   // fco.showingNodeBoundaryOverlays = true;
  //   // fco.logger.i('traverseAndMeasure(context) finished.');
  // }

  void dismissAllNodeWidgetOverlays() {
    for (GlobalKey nodeWidgetGK in fco.nodesByGK.keys) {
      fco.dismiss('${nodeWidgetGK.hashCode}-pink-overlay');
    }
  }

  // when a node is selected, whiten out ALL others
  // void showUnselectedNonTappableNodeWidgetOverlays() {
  //   void traverseAndMeasure(BuildContext el) {
  //     if ((fco.nodesByGK.containsKey(el.widget.key))) {
  //       GlobalKey gk = el.widget.key as GlobalKey;
  //       SNode? node = fco.nodesByGK[gk];
  //       if (node != null &&
  //           fco.selectedNode != null &&
  //           fco.selectedNode != node) {
  //         Rect? r = gk.globalPaintBounds(
  //           skipWidthConstraintWarning: true,
  //           skipHeightConstraintWarning: true,
  //         );
  //         if (r != null) {
  //           r = fco.restrictRectToScreen(r);
  //           node.showNonTappableNodeWidgetOverlay(borderRect: r);
  //         }
  //       }
  //     }
  //     el.visitChildElements((innerEl) {
  //       traverseAndMeasure(innerEl);
  //     });
  //   }
  //
  //   var pageContext = context;
  //   traverseAndMeasure(pageContext);
  //   // fco.showingNodeBoundaryOverlays = true;
  //   // fco.logger.i('traverseAndMeasure(context) finished.');
  // }

  // only called with MaterialAppWrapper context
  // void showNodeWidgetOverlaysNeedingInterception() {
  //   void traverseAndMeasure(BuildContext el, bool overlayWithABarrier) {
  //     if ((fco.nodesByGK.containsKey(el.widget.key))) {
  //       GlobalKey gk = el.widget.key as GlobalKey;
  //       SNode? node = fco.nodesByGK[gk];
  //       if (node != null && node.isHtmlElementViewOrPlatformView()) {
  //         Rect? r = gk.globalPaintBounds(
  //           skipWidthConstraintWarning: true,
  //           skipHeightConstraintWarning: true,
  //         );
  //         if (r != null) {
  //           r = fco.restrictRectToScreen(r);
  //           node.showNonTappableNodeWidgetOverlay(
  //             // selected: false,
  //             borderRect: r,
  //             scName: widget.routePath,
  //           );
  //         }
  //       }
  //     }
  //     el.visitChildElements((innerEl) {
  //       traverseAndMeasure(innerEl, false);
  //     });
  //   }
  //
  //   var pageContext = context;
  //   traverseAndMeasure(pageContext, true);
  //   // fco.showingNodeBoundaryOverlays = true;
  //   // fco.logger.i('traverseAndMeasure(context) finished.');
  // }

  static final String cid_EditorPassword = "editor-password";

  void editorPasswordDialog() {
    fco.registerKeystrokeHandler(cid_EditorPassword, (KeyEvent event) {
      // final key = event.logicalKey.keyLabel;

      // if (event is KeyDownEvent) {
      //   print("Key down: $key");
      // } else if (event is KeyUpEvent) {
      //   print("Key up: $key");
      // } else if (event is KeyRepeatEvent) {
      //   print("Key repeat: $key");
      // }

      if (event.logicalKey == LogicalKeyboardKey.escape) {
        fco.dismiss(cid_EditorPassword);
      }

      return false;
    });
    fco.showOverlay(
      calloutContent: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          margin: EdgeInsets.all(12),
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fco.purpleText(
                "Editor Access\n",
                fontSize: 24,
                family: 'Merriweather',
              ),

              StringOrNumberEditor(
                inputType: String,
                prompt: () => 'password',
                originalS: '',
                onTextChangedF: (String s) async {
                  if (!fco.appInfo.editorPasswords.contains(s)) {
                    return;
                  }
                  // if (!kDebugMode && !(fco.editorPasswords.contains(s))) return;
                  fco.dismiss(cid_EditorPassword);
                  fco.capiBloc.add(
                    CAPIEvent.signedIn(asGuestEditor: s == "GUEST"),
                  );
                },
                onEscapedF: (_) {
                  fco.dismiss(cid_EditorPassword);
                },
                dontAutoFocus: false,
                isPassword: true,
                onEditingCompleteF: (s) {
                  // if (s == "lakebeachocean") {
                  //   FCO.om.remove("TrainerPassword".hashCode);
                  //   setState(() {
                  //     HydratedBloc.storage.write("trainerIsSignedIn", true);
                  //   });
                  // }
                },
              ),
              Text.rich(
                TextSpan(
                  text: '\n\nAnonymous Users:\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'If you\'d like to see how editing works in an\n'
                          'app built with our ',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    TextSpan(
                      text: 'flutter_content',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          ' package,\nuse password "GUEST".\n'
                          'Any changes you make will be discarded when\n'
                              'you leave this browser tab, or sign out.',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      calloutConfig: CalloutConfig(
        cId: cid_EditorPassword,
        // initialTargetAlignment: Alignment.bottomLeft,
        // initialCalloutAlignment: Alignment.topRight,
        // finalSeparation: 200,
        barrier: CalloutBarrierConfig(
          opacity: .5,
          onTappedF: () async {
            fco.dismiss(cid_EditorPassword);
          },
        ),
        // initialCalloutW: 300,
        // initialCalloutH: 240,
        // decorationBorderRadius: 12,
        // // arrowType: ArrowTypeEnumModel.THIN_REVERSED,
        // decorationFillColors: ColorOrGradient.color(Colors.white),
        scrollControllerName: widget.routePath,
        onDismissedF: () {
          fco.removeKeystrokeHandler(cid_EditorPassword);
        },
      ),
      // targetGkF: ()=> fco.authIconGK,
      wrapInPointerInterceptor: true,
    );
  }

  static final String cid_editablePageName = "user-editable-page-name";

  void showPageNameDialog() {
    fco.registerKeystrokeHandler(cid_editablePageName, (KeyEvent event) {
      if (event.logicalKey == LogicalKeyboardKey.escape) {
        fco.dismiss(cid_editablePageName);
      }
      return false;
    });
    fco.showOverlay(
      calloutContent: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          fco.purpleText(
            fco.canEditContent()
                ? 'Create an editable Page'
                : 'Create your own editable Page',
            fontSize: 24,
            family: 'Merriweather',
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: 480,
            height: 100,
            child: StringOrNumberEditor(
              inputType: String,
              prompt: () => 'Page name',
              originalS: '',
              onTextChangedF: (String s) async {},
              onEscapedF: (_) {
                fco.dismiss(cid_editablePageName);
              },
              dontAutoFocus: false,
              onEditingCompleteF: (s) async {
                String pageName = s.replaceAll(' ', '-').toLowerCase();
                pageName = pageName.startsWith('/') ? pageName : '/$pageName';
                // add to appInfo
                if (!fco.canEditContent() &&
                    !fco.appInfo.anonymousUserEditablePages.contains(
                      pageName,
                    )) {
                  // jsArray issue
                  List<String> newList = fco.appInfo.anonymousUserEditablePages
                      .toList();
                  newList.add(pageName);
                  fco.appInfo.anonymousUserEditablePages = newList;
                  await fco.modelRepo.saveAppInfo();
                  fco.afterNextBuildDo(() {
                    fco.dismiss(cid_editablePageName);
                    fco.addSubRoute(newPath: pageName);
                    fco.afterMsDelayDo(1000, () {
                      fco.router?.go(pageName);
                    });
                  });
                } else if (fco.canEditContent() &&
                    !fco.appInfo.snippetNames.contains(pageName)) {
                  dismissAllNodeWidgetOverlays();
                  // fco.dismiss('exit-editMode');
                  // bool userCanEdit = canEditContent.isTrue;
                  final snippetName = pageName;
                  // final rootNode = SnippetTemplateEnum.empty.clone()
                  //   ..name = snippetName;
                  // SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
                  //   snippetName: snippetName,
                  //   templateSnippetRootNode: rootNode,
                  // ).then((_) {
                  //   fco.dismiss(cid_editablePageName);
                  //   fco.addSubRoute(
                  //     newPath: snippetName,
                  //     template: rootNode,
                  //   );
                  //   fco.router.go(pageName);
                  // });
                  fco.dismiss(cid_editablePageName);
                  fco.addSubRoute(newPath: snippetName);
                  fco.afterMsDelayDo(1000, () {
                    fco.router?.go(pageName);
                  });
                } else {
                  if (context.mounted) {
                    context.go(pageName);
                  }
                }
                return;
              },
            ),
          ),
        ],
      ),
      calloutConfig: CalloutConfig(
        cId: cid_editablePageName,
        // initialTargetAlignment: Alignment.bottomLeft,
        // initialCalloutAlignment: Alignment.topRight,
        // finalSeparation: 200,
        barrier: CalloutBarrierConfig(
          opacity: .5,
          onTappedF: () async {
            fco.dismiss(cid_editablePageName);
          },
        ),
        initialCalloutW: 500,
        initialCalloutH: 180,
        decorationBorderRadius: 12,
        decorationFillColors: ColorOrGradient.color(Colors.white),
        scrollControllerName: widget.routePath,
        onDismissedF: () {
          fco.removeKeystrokeHandler(cid_editablePageName);
        },
      ),
      // targetGkF: ()=> fco.authIconGK,
    );
  }

  void revertToVersion(
    VersionId? versionId,
    SnippetInfoModel snippetInfo,
    CAPIState state,
  ) {
    if (versionId == null) return;
    fco.capiBloc.add(
      CAPIEvent.revertSnippet(
        snippetName: snippetInfo.name,
        versionId: fco.removeNonNumeric(versionId),
      ),
    );
    fco.afterNextBuildDo(() async {
      // current snippet version will now be changed to prevId
      fco.logger.i('reverted to previous version.');
      // SNode.unhighlightSelectedNode();
      // var currPageState = fco.currentPageState;
      // currPageState?.unhideFAB();
      dismissAllNodeWidgetOverlays();
      fco.dismiss(CalloutConfigToolbar.CID);
      fco.appInfo.hideClipboard();
      // exitEditModeF();
      // fco.capiBloc
      //     .add(const CAPIEvent.popSnippetEditor());
      // fco.dismiss(snippetName, skipOnDismiss: true);
      final revertedVersion = snippetInfo.currentVersionFromCache();
      if (revertedVersion != null) {
        final newTreeC = SnippetTreeController(
          roots: [revertedVersion],
          childrenProvider: SNode.childrenProvider,
          parentProvider: SNode.parentProvider,
        );

        newTreeC.roots.first.validateTree();
        newTreeC.expand(revertedVersion);
        newTreeC.rebuild();

        snippetBeingEdited!
          ..setRootNode(revertedVersion)
          ..selectedNode = revertedVersion.child
          ..showProperties = false
          ..treeC = newTreeC;

        fco.refreshAll();
      }
      return;
    });
  }
}

class SelectionCutoutPainter extends CustomPainter {
  final Rect cutoutRect;

  SelectionCutoutPainter({required this.cutoutRect});

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Create the background paint
    final backgroundPaint = Paint()
      ..color = Colors.black
          .withValues(alpha: 0.6) // Semi-transparent black
      ..style = PaintingStyle.fill;

    // 2. Create the cutout path
    final cutoutPath = Path()..addRect(cutoutRect);

    // 3. Create the full canvas path
    final fullCanvasPath = Path()..addRect(Offset.zero & size);

    // 4. Combine the paths using difference
    final combinedPath = Path.combine(
      PathOperation.difference,
      fullCanvasPath,
      cutoutPath,
    );

    // 5. Draw the combined path
    canvas.drawPath(combinedPath, backgroundPaint);
    canvas.drawRect(
      cutoutRect,
      Paint()
        ..color = Colors
            .transparent // Semi-transparent black
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is SelectionCutoutPainter &&
        oldDelegate.cutoutRect != cutoutRect;
  }
}
