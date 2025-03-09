

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:google_fonts/google_fonts.dart';


class ClipboardNodeWidget extends StatelessWidget {
  final TreeController<Node> treeController;
  final TreeEntry<Node> entry;
  final bool onClipboard;

  const ClipboardNodeWidget({
    super.key,
    required this.treeController,
    required this.entry,
    this.onClipboard = false,
  });

  CAPIBloC get bloc => FlutterContentApp.capiBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CAPIBloC, CAPIState>(
      builder: (context, state) {
        bool selected = FlutterContentApp.snippetBeingEdited?.selectedNode == entry.node;
        ThemeData themeData = Theme.of(context);
        // TreeEntry<Node>? parentEntry = entry.parent;

        String displayedNodeName = entry.node is SnippetRootNode && (entry.node as SnippetRootNode).name.isNotEmpty
            ? (entry.node as SnippetRootNode).name
            : (entry.node as SNode).toString();

        Size textSize = calculateTextSize(
          text: displayedNodeName,
          numLines: 1,
          style: DefaultTextStyle.of(context).style,
        );

        return Row(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: textSize.width + 30),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: selected ? Colors.brown : Colors.grey, width: selected ? 3 : 1),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Text(
                displayedNodeName,
                style: GoogleFonts.getFont(
                  'Roboto Mono',
                  textStyle: themeData.textTheme.labelMedium,
                  color: entry.node is SnippetRootNode
                      ? Colors.white
                      : Colors.black,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  fontStyle:
                  entry.node is MC && !entry.hasChildren ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
