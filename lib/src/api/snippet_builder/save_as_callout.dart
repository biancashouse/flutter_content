import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:google_fonts/google_fonts.dart';

void showSaveAsCallout({
  required SNode selectedNode,
  SNode? selectionParentNode,
  // required TargetKeyFunc targetGKF,
  required ValueChanged<String> saveModelF,
  required ScrollControllerName? scName,
}) {
  fco.showOverlay(
    // targetGkF: targetGKF,
    calloutContent: InputSnippetName(
      selectedNode: selectedNode,
      selectionParentNode: selectionParentNode,
      // targetGKF: targetGKF,
      saveModelF: saveModelF,
    ),
    calloutConfig: CalloutConfig(
      cId: "input-snippet-name",
      initialCalloutW: 400,
      initialCalloutH: 159,
      initialTargetAlignment: Alignment.bottomCenter,
      initialCalloutAlignment: Alignment.topCenter,
      targetPointerType: TargetPointerType.thin_line(),
      bubbleOrTargetPointerColor: Colors.blue[900]!,
      finalSeparation: 60,
      decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
      barrier: CalloutBarrierConfig(
        opacity: 0.25,
        onTappedF: () async {
          fco.dismiss("input-snippet-name");
        },
      ),
      notUsingHydratedStorage: true,
      scrollControllerName: scName,
    ),
  );
}

class InputSnippetName extends StatefulWidget {
  final SNode selectedNode;
  final SNode? selectionParentNode;

  // final TargetKeyFunc targetGKF;
  final ValueChanged<String> saveModelF;

  const InputSnippetName({
    super.key,
    required this.selectedNode,
    this.selectionParentNode,
    // required this.targetGKF,
    required this.saveModelF,
  });

  @override
  InputSnippetNameState createState() => InputSnippetNameState();
}

class InputSnippetNameState extends State<InputSnippetName> {
  FocusNode? _focusNode;
  late TextEditingController _txtController;
  Color buttonColor = Colors.grey.withValues(alpha: .5);

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _txtController = TextEditingController();
    fco.afterNextBuildDo(() {
      Future.delayed(Duration.zero, () {
        _focusNode?.requestFocus();
      });
    });
  }

  @override
  void dispose() {
    if (!mounted) return;
    _focusNode?.dispose();
    _txtController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 200,
      //color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[_textField(), _saveBtn()],
      ),
    );
  }

  Widget _textField() => Container(
    padding: const EdgeInsets.all(10.0),
    color: Colors.white,
    child: TextField(
      enabled: true,
      controller: _txtController,
      onSubmitted: (s) {},
      onChanged: (s) {
        setState(() {
          if (s.isNotEmpty) buttonColor = Colors.yellow;
        });
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Snippet Name',
      ),
      autofocus: true,
      focusNode: _focusNode,
      maxLines: 1,
      style: GoogleFonts.getFont(
        'Roboto Mono',
        fontSize: 18,
        color: Colors.blue[900],
        fontWeight: FontWeight.w400,
        background: fco.whiteBgPaint,
      ),
    ),
  );

  Widget _saveBtn() => Padding(
    padding: const EdgeInsets.all(16.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        elevation: 2,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'save',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.green),
          ),
        ],
      ),
      onPressed: () {
        if (_txtController.text.isNotEmpty) {
          widget.saveModelF.call(_txtController.text);
          fco.dismiss("input-snippet-name");
        }
      },
    ),
  );
}
