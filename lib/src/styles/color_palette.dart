import 'package:flutter/material.dart';

class ColorPalette extends StatefulWidget {
  final Color? activeColor;
  final List<Color> colors;
  final Function(Color) onColorPicked;
  final bool forBg;

  const ColorPalette({
    super.key,
    this.activeColor,
    required this.onColorPicked,
    required this.colors,
    required this.forBg,
  });

  @override
  ColorPaletteState createState() => ColorPaletteState();
}

class ColorPaletteState extends State<ColorPalette> {
  late Color _activeColor;
  late List<_ColorHolder> _colorHolders;

  @override
  void initState() {
    _activeColor = widget.activeColor ?? widget.colors[0];

    _colorHolders = widget.colors
        .map((color) => _ColorHolder(
              color: color,
              active: color == _activeColor,
              onTap: (color) {
                setState(() => _activeColor = color);
                widget.onColorPicked(color);
              },
              forBg: widget.forBg,
            ))
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: _colorHolders,
      ),
    );
  }
}

class _ColorHolder extends StatelessWidget {
  final Color color;
  final Function(Color) onTap;
  final bool active;
  final bool forBg;

  const _ColorHolder({
    required this.color,
    required this.onTap,
    this.active = false,
    required this.forBg,
  });

  @override
  Widget build(BuildContext context) {
    return forBg
        ? Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: active ? const Border.fromBorderSide(BorderSide(color: Colors.white)) : const Border.fromBorderSide(BorderSide(color: Colors.transparent)),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () => onTap(color),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(BorderSide(color: Theme.of(context).colorScheme.onSurface)),
                    borderRadius: BorderRadius.circular(50),
                    color: color,
                  ),
                ),
              ),
            ),
          )
        : SizedBox(
            height: 40,
            width: 40,
            child: IconButton(
              onPressed: () => onTap(color),
              icon: const Icon(Icons.text_format),
              color: color,
              iconSize: 35,
            ),
          );
  }
}
