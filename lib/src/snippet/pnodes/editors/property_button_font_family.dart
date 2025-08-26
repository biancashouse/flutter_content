import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyButtonFontFamily extends StatefulWidget {
  final String label;
  final String? originalFontFamily;
  final Color menuBgColor;
  final Function(String?) onChangeF;
  final ScrollControllerName? scName;

  const PropertyButtonFontFamily({
    required this.label,
    required this.originalFontFamily,
    required this.menuBgColor,
    required this.onChangeF,
    required this.scName,
    super.key,
  });

  @override
  State<PropertyButtonFontFamily> createState() =>
      _PropertyButtonFontFamilyState();
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
        ? Text('fontFamily: ${widget.originalFontFamily}',
            style: const TextStyle(color: Colors.white))
        : const Text('fontFamily...', style: TextStyle(color: Colors.white));
    return PropertyCalloutButton(
      cId: 'font-family',
      scName: widget.scName,
      // notifier: ValueNotifier<int>(0),
      labelWidget: fontFamilyLabel,
      calloutButtonSize: const Size(200, 40),
      menuBgColor: widget.menuBgColor,
      calloutContents: (ctx) {
        return IntrinsicWidth(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: fco.googleFontNames.map((family) {
                return RadioListTile<String>(
                  fillColor:
                      const WidgetStatePropertyAll<Color?>(Colors.purpleAccent),
                  dense: true,
                  value: family,
                  groupValue: widget.originalFontFamily,
                  tileColor: Colors.purpleAccent,
                  title: Text(
                    family,
                    softWrap: false,
                    style: googleFontTextStyle(context,
                        fontFamily: family, color: Colors.white),
                    overflow: TextOverflow.clip,
                  ),
                  toggleable: true,
                  onChanged: (newFamily) {
                    widget.onChangeF.call(newFamily);
                    fco.dismiss('font-family');
                    // fco.afterMsDelayDo(500, () {
                    //   fco.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
                    // });
                  },
                );
              }).toList()),
        );
      },
      calloutSize: Size(240, 50.0 * fco.googleFontNames.length),
    );
  }

  TextStyle googleFontTextStyle(
    context, {
    required String fontFamily,
    Color? color,
    double? fontSize,
    Material3TextSizeEnum? fontSizeName,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    double? lineHeight,
    double? letterSpacing,
  }) =>
      GoogleFonts.getFont(
        fontFamily,
        color: color,
        textStyle:
            fontSizeName?.materialTextStyle(themeData: Theme.of(context)),
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        height: lineHeight,
        letterSpacing: letterSpacing,
      );
}
