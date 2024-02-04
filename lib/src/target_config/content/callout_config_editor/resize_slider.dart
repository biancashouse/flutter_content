import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class ResizeSlider extends StatefulWidget {
  final double value;
  final double? min;
  final double? max;
  final int? divisions;
  final IconData? icon;
  final double? iconSize;
  final Color? color;
  final bool showValue;
  final Function(double) onChange;

  const ResizeSlider({
    required this.value,
    this.icon,
    this.iconSize,
    this.color,
    required this.onChange,
    this.min = 0,
    this.max = 100,
    this.showValue = true,
    this.divisions,
  });

  @override
  _ResizeSliderState createState() => _ResizeSliderState();
}

class _ResizeSliderState extends State<ResizeSlider> {
  late double _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.icon != null) Icon(widget.icon, color: widget.color ?? Colors.white, size: widget.iconSize,),
        Expanded(
          child: SliderTheme(
            data: SliderThemeData(
              activeTrackColor: widget.color ?? Theme.of(context).colorScheme.background,
              inactiveTrackColor: widget.color ?? Theme.of(context).colorScheme.background,
              thumbColor: widget.color ?? Theme.of(context).colorScheme.background,
              overlayColor: widget.color ?? Theme.of(context).colorScheme.background.withOpacity(0.2),
              trackHeight: 2,
            ),
            child: Slider(
              value: _value,
              onChanged: (value) {
                setState(() => _value = value);
                widget.onChange(value);
              },
              onChangeStart: (_) {
                Callout.preventParentCalloutDrag(context);
              },
              onChangeEnd: (_) {
                Callout.allowParentCalloutDrag(context);
              },
              min: widget.min!,
              max: widget.max!,
              divisions: widget.divisions,
            ),
          ),
        ),
        if (widget.showValue) Text(_value.toStringAsFixed(1), style: TextStyle(color: widget.color ?? Colors.white)),
      ],
    );
  }
}
