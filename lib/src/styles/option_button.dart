import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final bool isActive;
  final Function()? onPressed;
  final Widget child;
  final Size? size;
  final Color? fillColor;

  const OptionButton({super.key,
    this.onPressed,
    required this.child,
    this.isActive = false,
    this.size,
    this.fillColor,
  });
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(size ?? const Size(45, 45)),
      fillColor: fillColor,
      highlightColor: Theme.of(context).colorScheme.background,
      splashColor: Theme.of(context).colorScheme.background,
      // fillColor: isActive ? Colors.white:null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: isActive ? Colors.yellow : Colors.white, width: isActive ? 5:1,),
      ),
      onPressed: (){
        onPressed?.call();
      },
      child: child,
    );
  }
}
