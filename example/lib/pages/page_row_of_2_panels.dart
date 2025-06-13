import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class Page_RowOf2Panels extends StatelessWidget {
  const Page_RowOf2Panels({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SnippetPanel.fromNodes(
            panelName: 'panel1',
            snippetRootNode: SnippetRootNode(
              name: 'panels-demo1-panel1',
              child: PaddingNode(
                padding: EdgeInsetsValue(top: 30, left: 30, bottom: 30, right: 30),
                child: AssetImageNode(name: 'assets/images/flowers.jpg'),
              ),
            ),
            scName: null,
          ),
        ),
        Expanded(
          child: SnippetPanel.fromNodes(
            panelName: 'panel2',
            snippetRootNode: SnippetRootNode(
              name: 'panels-demo2-panel2',
              child: CarouselNode(children: [
                AssetImageNode(name: 'assets/images/frog.jpg'),
                AssetImageNode(name: 'assets/images/hummingbird.jpg'),
                AssetImageNode(name: 'assets/images/indian-chat.jpg'),
              ]),
            ),
            scName: null,
          ),
        ),
      ],
    );
  }

}
