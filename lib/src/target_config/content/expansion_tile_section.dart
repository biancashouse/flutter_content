import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

const TextStyle purple20 = TextStyle(color: Colors.purpleAccent, fontSize: 24);
const TextStyle white30 = TextStyle(color: Colors.white, fontSize: 30);
const TextStyle white36 = TextStyle(color: Colors.white, fontSize: 36);

class ExpansionTileSection extends StatefulWidget {
  final String name;
  final ExpansionTileController controller;

  const ExpansionTileSection(this.name, this.controller, {super.key});

  @override
  State<ExpansionTileSection> createState() => _ExpansionTileSectionState();
}

class _ExpansionTileSectionState extends State<ExpansionTileSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          controller: widget.controller,
          title: Text.rich(
            TextSpan(style: white30, children: <InlineSpan>[
              WidgetSpan(
                  child: SnippetPanel(
                panelName: '${widget.name}-heading',
                snippetName: BODY_PLACEHOLDER,
              )),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      backgroundColor: Colors.purpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: SnippetPanel(
                      panelName: '${widget.name}-btn',
                      snippetName: BODY_PLACEHOLDER,
                    ),
                    onPressed: () {
                      if (widget.controller.isExpanded) {
                        widget.controller.collapse();
                      } else {
                        widget.controller.expand();
                      }
                    },
                  ),
                ),
              ),
            ]),
          ),
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return SizedBox(
                  height: 500,
                  child: Scrollbar(
                    child: ListView(children: [
                      SnippetPanel(
                        panelName: '${widget.name}-expanded',
                        snippetName: BODY_PLACEHOLDER,
                      )
                    ]),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
