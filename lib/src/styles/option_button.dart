import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final bool isActive;
  final Function()? onPressed;
  final Widget child;
  final Size? size;
  final Color? fillColor;
  final String tooltip;

  const OptionButton({super.key,
    this.onPressed,
    required this.child,
    this.isActive = false,
    this.size,
    this.fillColor,
    this.tooltip = '',
  });
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(size ?? const Size(45, 45)),
      fillColor: fillColor,
      highlightColor: Theme.of(context).colorScheme.surface,
      splashColor: Theme.of(context).colorScheme.surface,
      // fillColor: isActive ? Colors.white:null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: isActive ? Colors.yellow : Colors.purple, width: isActive ? 5:1,),
      ),
      onPressed: (){
        onPressed?.call();
      },
      child: Tooltip(message:tooltip, child: child),
    );
  }
}
