import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/editable_page/snippet_editor_side_panel.dart';
import 'package:flutter_content/src/api/editable_page/tappable_node_borders.dart';
import 'package:flutter_content/src/snippet/snode_widget.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/hotspot_target_config_toolbar/hotspot_target_config_toolbar.dart';

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

  // static ScrollController? ancestorSc(BuildContext context, Axis? axis) {
  //   ScrollableState? scrollableState = Scrollable.maybeOf(context, axis: axis);
  //   return scrollableState?.widget.controller;
  // }

  @override
  State<EditablePage> createState() => EditablePageState();
}

class EditablePageState extends State<EditablePage> {
  List<NodeRenderData> borderRects = [];
  bool _needsToPopulateRects = false;
  GlobalKey zoomerGk = GlobalKey();
  OverlayEntry? _sidePanelEntry;

  void _showSidePanelOverlay() {
    if (_sidePanelEntry != null) return;
    _sidePanelEntry = OverlayEntry(
      builder: (_) => BlocProvider.value(
        value: fco.capiBloc,
        child: const SnippetEditorSidePanel(),
      ),
    );
    Overlay.of(context).insert(_sidePanelEntry!);
  }

  void _hideSidePanelOverlay() {
    _sidePanelEntry?.remove();
    _sidePanelEntry = null;
  }

  @override
  void initState() {
    super.initState();
    fco.currentEditablePagePath = widget.routePath;
  }

  @override
  void dispose() {
    _hideSidePanelOverlay();
    super.dispose();
  }

  // also allow for a selected node
  void _populateNodeBorderRects() {
    if (fco.capiBloc.state.activeSnippetName == null &&
        fco.capiBloc.aSnippetIsNotBeingEdited()) {
      return;
    }
    List<SNode> nodes = [];
    SnippetRootNode? rootNode;
    // not yet editing, show all widget borderRects
    SnippetInfoModel? snippetInfo = fco.appInfo.cachedSnippetInfo(
      fco.capiBloc.state.activeSnippetName != null
          ? fco.capiBloc.state.activeSnippetName!
          : fco.capiBloc.state.snippetBeingEdited?.getRootNode().name ?? '???',
    );
    rootNode = snippetInfo?.currentVersionInCache();
    // traverse node
    borderRects.clear();
    if (rootNode != null) {
      nodes = rootNode.findDescendantNodes();
      // print('found ${nodes.length} nodes in snippet $snippetName');
      for (SNode node in nodes) {
        if (node is! QuillTextNode && node is! MarkdownNode) {
          Rect? borderRect = node.calcBorderRect();
          if (borderRect != null) {
            borderRects.add(NodeRenderData(node: node, rect: borderRect));
          }
        }
      }
    }
    // print('populateNodeBorderRects measured ${borderRects.length} nodes.');
    // for (NodeRenderData data in borderRects) {
    //   print('rect: ${data.rect}');
    // }
  }

  @override
  Widget build(BuildContext context) {
    // print('build - borderRects: ${borderRects.length}');
    return BlocConsumer<CAPIBloC, CAPIState>(
      listenWhen: (prev, curr) =>
          prev.activeSnippetName != curr.activeSnippetName ||
          (prev.snippetBeingEdited == null) != (curr.snippetBeingEdited == null) ||
          prev.snippetBeingEdited?.selectedNode !=
              curr.snippetBeingEdited?.selectedNode,
      listener: (lcontext, state) {
        if (state.activeSnippetName != null && state.snippetBeingEdited == null) {
          // entered node selection mode
          _needsToPopulateRects = true;
        } else if (state.snippetBeingEdited != null &&
            state.activeSnippetName == null) {
          // entered editing mode — show panel overlay and populate rects
          _showSidePanelOverlay();
          fco.afterNextBuildDo(() {
            _needsToPopulateRects = true;
          });
        } else if (state.snippetBeingEdited == null &&
            state.activeSnippetName == null) {
          // left editing mode — remove panel overlay
          _hideSidePanelOverlay();
        } else if (state.snippetBeingEdited?.selectedNode != null) {
          // node selected within editing — refresh border rects
          if (fco.anyPresent(['quill-te', 'uml-te', 'markdown-te'])) return;
          fco.dismissAll();
          fco.afterNextBuildDo(() {
            _needsToPopulateRects = true;
          });
        }
      },
      buildWhen: (previous, current) {
        if (_needsToPopulateRects) return true;
        if (previous.activeSnippetName != current.activeSnippetName) return true;
        if ((previous.snippetBeingEdited == null) !=
            (current.snippetBeingEdited == null)) return true;
        // update border rects on selection change
        if (previous.snippetBeingEdited?.selectedNode !=
            current.snippetBeingEdited?.selectedNode) return true;
        if ((previous.isSignedIn != current.isSignedIn) &&
            !fco.canEditContent()) return true;
        if (current.onlyTargetsWrappers) return false;
        return false;
      },
      builder: (BuildContext context, CAPIState state) {
        final bloc = context.read<CAPIBloC>();
        final builtWidget = GestureDetector(
          onTap: () {
            if (bloc.showTappableBorderRects()) {
              bloc.add(CAPIEvent.exitNodeSelectionMode());
            }
          },
          child: Material(child: _pageStack(bloc)),
        );
        return fco.isAndroid
            ? fco.androidAwareBuild(context, builtWidget)
            : builtWidget;
      },
    );
  }

  void _tappedToEditSnippetAndSelectNode(SNode node) {
    SnippetRootNode? rootNode = node.rootNodeOfSnippet();
    if (rootNode == null) return;
    SnippetName? snippetName = rootNode.name;
    // maybe a page snippet, so check name in appInfo: maybe prefix with /
    // var names = fco.appInfo.snippetNames;
    if (fco.appInfo.snippetNames.contains('/$snippetName')) {
      snippetName = '/$snippetName';
    }

    if (SnippetRootNode.isHotspotCalloutContent(snippetName)) {
      final cc = fco.findOE(snippetName)?.calloutConfig;
      cc?.rebuild(() {
        cc
          ..barrier = null
          ..targetPointerType = TargetPointerType.none();
      });
    }

    pushThenShowNamedSnippetWithNodeSelected(rootNode, node);
  }

  void pushThenShowNamedSnippetWithNodeSelected(
    SnippetRootNode rootNode,
    SNode selectedNode, {
    HotspotTargetModel? targetBeingConfigured,
  }) {
    var snippetRootContext = rootNode.child?.nodeWidgetGK?.currentContext;
    if (snippetRootContext == null) {
      fco.showToast(
        msg: "This node is not visible right now",
        bgColor: Colors.white,
        textColor: Colors.red,
        removeAfterMs: 5000,
      );
      return;
    }

    context.read<CAPIBloC>().add(
      CAPIEvent.pushSnippetEditor(
        rootNode: rootNode,
        selectedNode: selectedNode,
      ),
    );
    fco.afterNextBuildDo(() {
      if (fco.snippetBeingEdited != null) {
        if (!fco.appInfo.clipboardIsEmpty) {
          fco.appInfo.showFloatingClipboard();
        }
        fco.hide(HotspotTargetConfigToolbar.CID);
      }

      // point out the selected node widget
      var selectedNodeContext = selectedNode.nodeWidgetGK?.currentContext;
      if (selectedNodeContext != null) {
        SNodeWidget.pointOutSelectedNode();
      }

      // // point out the selected node in the snippet tree
      // fco.afterMsDelayDo(1000, () {
      //   var cc = selectedNode.nodeGK?.currentContext;
      //   if (cc != null) {
      //     Scrollable.ensureVisible(
      //       cc,
      //       duration: const Duration(milliseconds: 500),
      //       curve: Curves.easeOut,
      //       alignment: .5,
      //     );
      //   }
      // });
    });
  }

  /// Unified page stack for all three modes:
  /// - Normal: Zoomer(child) only
  /// - Node selection: SnippetBuilder + TappableNodeBorders
  /// - Editing: SnippetBuilder + TappableNodeBorders + SnippetEditorSidePanel
  Widget _pageStack(CAPIBloC bloc) {
    final showSnippet =
        bloc.showTappableBorderRects() || bloc.aSnippetIsBeingEdited();
    final snippetName = bloc.state.activeSnippetName ??
        bloc.state.snippetBeingEdited?.getRootNode().name;

    return Stack(
      children: [
        if (!showSnippet) Zoomer(key: zoomerGk, child: widget.child),
        if (showSnippet)
          SnippetBuilder(
            snippetName: snippetName,
            onLayoutDone: () {
              if (_needsToPopulateRects && mounted) {
                if (bloc.showTappableBorderRects()) {
                  fco.showToast(
                    msg: 'tap a node to start editing,\n<Esc> to cancel',
                    removeAfterMs: 5000,
                    bgColor: Colors.purpleAccent.withValues(alpha: .8),
                    textColor: Colors.yellow,
                    width: 240,
                    height: 120,
                  );
                }
                setState(() {
                  _populateNodeBorderRects();
                  _needsToPopulateRects = false;
                });
              }
            },
            onScrollF: (_) => setState(_populateNodeBorderRects),
          ),
        if (showSnippet && borderRects.isNotEmpty)
          TappableNodeBorders(
            renderData: borderRects,
            onNodeTapped: (node) {
              if (bloc.aSnippetIsBeingEdited()) {
                fco.dismiss('pink-overlay');
                bloc.add(CAPIEvent.selectNode(node: node));
                fco.afterNextBuildDo(() => SNodeWidget.pointOutSelectedNode());
              } else {
                if (node is QuillTextNode || node is MarkdownNode) return;
                _tappedToEditSnippetAndSelectNode(node);
              }
            },
          ),
      ],
    );
  }

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
    // final gk = GlobalKey();
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
                  // fco.dismiss(cid_EditorPassword);
                  fco.dismissAll();
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
        onDismissedF: () {
          fco.removeKeystrokeHandler(cid_EditorPassword);
        },
      ),
      // targetGkF: ()=> fco.authIconGK,
      wrapInPointerInterceptor: true,
      // targetGK: gk,
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
        onDismissedF: () {
          fco.removeKeystrokeHandler(cid_editablePageName);
        },
      ),
      // targetGkF: ()=> fco.authIconGK,
    );
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

// First, define this helper class either in the same file or a utility file.
// This class overrides the default scroll physics for all descendant scrollables.
