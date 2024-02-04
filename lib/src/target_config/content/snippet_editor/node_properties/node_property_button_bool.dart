import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnode.dart';


class NodePropertyEditorBool extends StatefulWidget {
  final PropertyName name;
  final bool boolValue;
  final ValueChanged<bool>? onChanged;

  const NodePropertyEditorBool({required this.name, this.boolValue = false, required this.onChanged, super.key});

  @override
  State<NodePropertyEditorBool> createState() => _NodePropertyEditorBoolState();
}

class _NodePropertyEditorBoolState extends State<NodePropertyEditorBool> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.boolValue;
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.orange;
      }
      return isSelected ? Colors.purple : Colors.purpleAccent;
    }

    return Row(
      children: [
        Text(
          widget.name,
          style: const TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        Checkbox(
          value: isSelected,
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          onChanged: (bool? value) {
            setState(() {
              isSelected = value!;
              widget.onChanged?.call(isSelected);
            });
          },
        ),
      ],
    );
  }
}
