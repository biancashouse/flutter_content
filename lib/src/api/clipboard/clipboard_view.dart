import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_controller.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_indentation.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_view.dart';

import 'clipboard_node_widget.dart';

const double CLIPBOARD_TAB_W = 200;
const double CLIPBOARD_TAB_H = 200;

class ClipboardView extends StatelessWidget {
  final ScrollControllerName? scName;

  const ClipboardView({this.scName, super.key});

  @override
  Widget build(BuildContext context) {
    CAPIBloC bloc = fco.capiBloc;
    SNode? clipboard = fco.appInfo.clipboard;
    if (clipboard == null) return const Offstage();
    SnippetTreeController clipboardTreeC = SnippetTreeController(
      roots: [clipboard],
      childrenProvider: Node.snippetTreeChildrenProvider,
      parentProvider: Node.snippetTreeParentProvider,
    );
    clipboardTreeC.expandCascading([clipboard]);

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
                fco.hide("floating-clipboard");
                bloc.add(CAPIEvent.updateClipboard(newContent: null, scName: scName));
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
