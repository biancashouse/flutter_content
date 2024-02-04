import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class FlutterContentPage extends StatefulWidget {
  final PanelName panelName;
  final SnippetName snippetName;
  final String? fromTemplate;

  const FlutterContentPage({required this.panelName, required this.snippetName, this.fromTemplate, super.key});

  @override
  _FlutterContentPageState createState() => _FlutterContentPageState();
}

class _FlutterContentPageState extends State<FlutterContentPage> with SingleTickerProviderStateMixin {
  ScrollController sc = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  // https://github.com/flutter/flutter/issues/25827
  @override
  Widget build(BuildContext context) => Useful.isAndroid ? _buildAndroid(context) : _build(context);

  // wait for android to register screen size
  Widget _buildAndroid(BuildContext context) => FutureBuilder<double?>(
      future: _whenNotZero(
        Stream<double>.periodic(const Duration(milliseconds: 50), (_) => MediaQuery.of(context).size.width),
      ),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData && (snapshot.data ?? 0) > 0) {
          return _build(context);
        }
        return const CircularProgressIndicator(
          color: Colors.orange,
        );
      });

  Widget _build(BuildContext context) => SnippetPanel(
        panelName: widget.panelName,
        snippetName: widget.snippetName,
        fromTemplate: widget.fromTemplate,
      );

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
