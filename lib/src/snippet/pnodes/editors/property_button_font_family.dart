import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button.dart';


class PropertyButtonFontFamily extends StatefulWidget {
  final String label;
  final String? originalFontFamily;
  final Color menuBgColor;
  final Function(String?) onChangeF;

  const PropertyButtonFontFamily(
      {required this.label, required this.originalFontFamily, required this.menuBgColor, required this.onChangeF, super.key});

  @override
  State<PropertyButtonFontFamily> createState() => _PropertyButtonFontFamilyState();
}

class _PropertyButtonFontFamilyState extends State<PropertyButtonFontFamily> {
  late GlobalKey propertyBtnGK;

  @override
  void initState() {
    super.initState();
    propertyBtnGK = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    Widget fontFamilyLabel = widget.originalFontFamily != null
        ? Text('style.fontFamily: ${widget.originalFontFamily}', style: const TextStyle(color: Colors.white))
        : const Text('style.fontFamily...', style: TextStyle(color: Colors.white));
    return PropertyCalloutButton(
      feature: 'font-family',
      notifier: ValueNotifier<int>(0),
      labelWidget: fontFamilyLabel,
      calloutButtonSize: const Size(200, 40),
      menuBgColor: widget.menuBgColor,
      calloutContents: (ctx) {
        return IntrinsicWidth(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: FC().googleFontNames.map((family) {
                return RadioListTile<String>(
                  dense: true,
                  value: family,
                  groupValue: widget.originalFontFamily,
                  tileColor: Colors.brown.shade50,
                  title: Text(
                    family,
                    softWrap: false,
                    style: Useful.googleFontTextStyle(context, fontFamily: family, color: Colors.white),
                    overflow: TextOverflow.clip,
                  ),
                  toggleable: true,
                  onChanged: (newFamily) {
                    widget.onChangeF.call(newFamily);
                    Useful.afterMsDelayDo(500, () {
                      Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
                    });
                  },
                );
              }).toList()),
        );
      },
      calloutSize: Size(240, 50.0 * FC().googleFontNames.length),
    );
  }
}
