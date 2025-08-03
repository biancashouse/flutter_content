import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class Page_RowOf2Containers extends StatelessWidget {
  const Page_RowOf2Containers({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SnippetPanel.fromNodes(
              panelName: 'panel1',
              snippetRootNode: SnippetRootNode(
                name: 'container-5',
                child: PaddingNode(
                  padding: EdgeInsetsValue(
                    top: 30,
                    left: 30,
                    bottom: 30,
                    right: 30,
                  ),
                  child: ContainerNode(csPropGroup: ContainerStyleProperties()),
                ),
              ),
              scName: null,
            ),
          ),
          Expanded(
            child: SnippetPanel.fromNodes(
              panelName: 'panel2',
              snippetRootNode: SnippetRootNode(
                name: 'container-6',
                child: CenterNode(),
              ),
              scName: null,
            ),
          ),
        ],
      ),
    );
  }
}
