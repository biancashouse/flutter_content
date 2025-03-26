import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FYIPNode extends PNode {
  final String? label;
  final String? msg;
  final String? webLink;
  final String? buttonLabel;

  FYIPNode({
    this.label,
    this.msg,
    this.webLink,
    this.buttonLabel,
    required super.snode,
    required super.name,
  }) {
    assert(label != null || (webLink != null && buttonLabel != null),
        'You must specify a buttonLabel!');
    assert(msg != null || webLink != null,
        'You must specify a msg or a webLink arg');
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    return SizedBox(
      width: 260, //height: 200,
      child: ExpansionTile(
        showTrailingIcon: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.help_outline,
              color: Colors.yellow,
            ),
            Gap(10),
            Expanded(
              // no label implies show the button
              child: fco.coloredText(label!,
                  color: Colors.yellow,
                  fontStyle: FontStyle.italic,
                  maxLines: 6),
            ),
          ],
        ),
        children: [
          if (msg != null) fco.coloredText(msg!, color: Colors.yellow),
          if (webLink != null) Gap(10),
          if (webLink != null)
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
              ),
              onPressed: () async {
                if (await canLaunchUrlString(webLink!)) {
                  launchUrlString(webLink!);
                }
              },
              child: Text('Understanding Constraints'),
            ),
          Gap(10),
        ],
      ),
    );
  }
}

class FlutterDocPNode extends PNode {
  final String? webLink;
  final String? buttonLabel;

  FlutterDocPNode({
    this.webLink,
    this.buttonLabel,
    required super.snode,
    required super.name,
  });

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    return Container(
      width: 290,
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton.icon(
        icon: FlutterLogo(
          size: 20,
        ),
        iconAlignment: IconAlignment.start,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.yellow),
          foregroundColor: WidgetStatePropertyAll(Colors.black),
        ),
        onPressed: () async {
          if (await canLaunchUrlString(webLink!)) {
            launchUrlString(webLink!);
          }
        },
        label: Text(buttonLabel!),
      ),
    );
  }
}
