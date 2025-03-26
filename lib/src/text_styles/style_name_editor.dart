import 'package:flutter/material.dart';

class StyleNameEditor extends StatelessWidget {
  final TextEditingController teC;
  final FocusNode focusNode;
  final ValueChanged<String> onChangeF;
  final VoidCallback onEditingCompleteF;
  final String label;
  final String? tooltip;

  const StyleNameEditor({
    required this.teC,
    required this.focusNode,
    required this.onChangeF,
    required this.onEditingCompleteF,
    required this.label,
    this.tooltip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
        valueListenable: teC,
        builder: (BuildContext context, TextEditingValue value, child) {
          return SizedBox(
            width: 100,
            height: 36,
            child: Tooltip(
              message: tooltip,
              child: TextField(
                controller: teC,
                focusNode: focusNode,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: label,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    iconSize: 14,
                    onPressed: () {
                      teC.text = '';
                      onChangeF('');
                    },
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26),
                  ),
                ),
                onChanged: (s) {
                  onChangeF(s);
                },
                onEditingComplete: () {
                  onEditingCompleteF();
                },
              ),
            ),
          );
        });
  }
}
