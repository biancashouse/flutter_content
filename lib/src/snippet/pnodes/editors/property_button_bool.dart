import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';


class PropertyEditorBool extends StatefulWidget {
  final PropertyName name;
  final bool boolValue;
  final ValueChanged<bool>? onChanged;

  const PropertyEditorBool({required this.name, this.boolValue = false, required this.onChanged, super.key});

  @override
  State<PropertyEditorBool> createState() => _PropertyEditorBoolState();
}

class _PropertyEditorBoolState extends State<PropertyEditorBool> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.boolValue;
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
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
          fillColor: WidgetStateProperty.resolveWith(getColor),
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
