import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/clipboard_node_widget.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

const double CLIPBOARD_TAB_W = 200;
const double CLIPBOARD_TAB_H = 200;

class ClipboardView extends StatelessWidget {
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  const ClipboardView({this.ancestorHScrollController, this.ancestorVScrollController, super.key});

  @override
  Widget build(BuildContext context) {
    CAPIBloC bloc = FC().capiBloc;
    EncodedJson? clipboardJson = FC().appModel.clipboard;
    if (clipboardJson == null) return const Offstage();
    var clipboardNode = STreeNodeMapper.fromJson(clipboardJson);
    SnippetTreeController clipboardTreeC = SnippetTreeController(
      roots: [clipboardNode],
      childrenProvider: Node.snippetTreeChildrenProvider,
    );
    clipboardTreeC.expandCascading([clipboardNode]);

    return SizedBox(
      width: CLIPBOARD_TAB_W,
      height: CLIPBOARD_TAB_H,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              border: Border.all(color: Colors.blue[700]!, width: 3),
            ),
            child: InteractiveViewer(
              constrained: false,
              child: SizedBox(
                width: 1000,
                height: 1000,
                child: TreeView<Node>(
                  physics: const NeverScrollableScrollPhysics(),
                  treeController: clipboardTreeC,
                  nodeBuilder: (BuildContext context, TreeEntry<Node> entry) {
                    return TreeIndentation(
                      entry: entry,
                      child: ClipboardNodeWidget(
                        treeController: clipboardTreeC,
                        entry: entry,
                        onClipboard: true,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: IconButton(
              tooltip: 'clear the clipboard',
              onPressed: () {
                Callout.hide("floating-clipboard");
                bloc.add(const CAPIEvent.updateClipboard(newContent: null));
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
