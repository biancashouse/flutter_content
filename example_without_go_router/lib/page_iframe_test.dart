import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';

class Page_IframeTest extends StatelessWidget {
  const Page_IframeTest({super.key});

  @override
  Widget build(BuildContext context) {
    SnippetBuilder sp = SnippetBuilder.fromNodes(
      snippetRootNode: SnippetRootNode(
        name: 'iframe-demo',
        child: IFrameNode(),
      ),
      scName: null, //sC.name, because no scrolling used
    );

    final scaffold = sp;

    return EditablePage(routePath: '/', key: GlobalKey(), child: scaffold);
  }
}
