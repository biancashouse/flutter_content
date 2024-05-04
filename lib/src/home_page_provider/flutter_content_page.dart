import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/snippet_templates.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FlutterContentPage extends HookWidget {
  final PanelName panelName;
  final SnippetName snippetName;
  final SnippetTemplate fromTemplate;

  const FlutterContentPage(
      {required this.panelName,
      required this.snippetName,
      this.fromTemplate = SnippetTemplate.empty_snippet,
      super.key});

  // https://github.com/flutter/flutter/issues/25827
  @override
  Widget build(BuildContext context) {
    final snippetPanel = SnippetPanel(
      panelName: panelName,
      snippetName: snippetName,
      fromTemplate: fromTemplate,
    );
    final zoomer = Zoomer(
      child: Useful.isAndroid
          ? _buildAndroid(context, snippetPanel)
          : snippetPanel,
    );
    return zoomer;
  }

  // wait for android to register screen size
  Widget _buildAndroid(BuildContext context, SnippetPanel snippetPanel) =>
      FutureBuilder<double?>(
          future: _whenNotZero(
            Stream<double>.periodic(const Duration(milliseconds: 50),
                (_) => MediaQuery.of(context).size.width),
          ),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData && (snapshot.data ?? 0) > 0) {
              return snippetPanel;
            }
            return const CircularProgressIndicator(
              color: Colors.orange,
            );
          });

  //       panelName: widget.panelName,
  //       snippetName: widget.snippetName,
  //       fromTemplate: widget.fromTemplate,
  //     );

  // TransformableScaffold(
  //   scaffoldBody: () => Scaffold(
  //     backgroundColor: Colors.white,
  //     // press escape for 3s to trigger editmode dialogue
  //     body: Center(
  //       child: Column(
  //         children: [
  //           SnippetPanel(pName: 'menu-panel', sName: 'main-menu'),
  //           Expanded(child: SnippetPanel(pName: 'body panel', sName: 'home')),
  //         ],
  //       ),
  //     ),
  //   ),
  //   ancestorVScrollController: sc,
  // );

// https://github.com/flutter/flutter/issues/25827
  Future<double?> _whenNotZero(Stream<double> source) async {
    await for (double value in source) {
      if (value > 0) {
        return value;
      }
    }
    return null;
    // stream exited without a true value, maybe return an exception.
  }
}
