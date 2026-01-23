import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyButtonFontFamily extends StatefulWidget {
  final String label;
  final String? originalFontFamily;
  final Color menuBgColor;
  final Function(String?) onChangeF;

  const PropertyButtonFontFamily({
    required this.label,
    required this.originalFontFamily,
    required this.menuBgColor,
    required this.onChangeF,
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
    late Widget fontFamilyLabel;
    if (widget.originalFontFamily == null) {
      fontFamilyLabel = Text(
        'fontFamily...',
        style: const TextStyle(color: Colors.white),
      );
    } else {
      fontFamilyLabel = Text.rich(
        TextSpan(
          text: 'fontFamily:',
          children: [
            TextSpan(
              text: widget.originalFontFamily,
              style: googleFontTextStyle(
                context,
                fontFamily: widget.originalFontFamily!,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }

    // get list of font families
    final fontFamilyLabels = fco.googleFontNames..sort;
    final fontFamilyTiles = fontFamilyLabels.map((family) {
      try {
        final listTile = ListTile(
          // fillColor:
          //     const WidgetStatePropertyAll<Color?>(Colors.purpleAccent),
          dense: true,
          title: Text(family),
          titleTextStyle: googleFontTextStyle(context, fontFamily: family),
          tileColor: Colors.purpleAccent,
          // title: Text(
          //   label,
          //   softWrap: false,
          //   style: googleFontTextStyle(context,
          //       fontFamily: family, color: Colors.white),
          //   overflow: TextOverflow.clip,
          // ),
          // toggleable: true,
          onTap: () {
            widget.onChangeF.call(family);
            fco.dismiss('font-family');
          },
        );
        return listTile;
      } catch (e) {
        return ListTile(title: Text('$family: missing Google Font!'));
      }
    });

    return PropertyCalloutButton(
      cId: 'font-family',
      // notifier: ValueNotifier<int>(0),
      labelWidget: fontFamilyLabel,
      calloutButtonSize: const Size(200, 40),
      menuBgColor: widget.menuBgColor,
      calloutContents: (ctx) {
        return IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: fontFamilyTiles.toList(),
          ),
        );
      },
      calloutSize: Size(240, 50.0 * fco.googleFontNames.length),
    );
  }

  TextStyle googleFontTextStyle(
    BuildContext context, {
    required String fontFamily,
    Color? color,
    double? fontSize,
    Material3TextSizeEnum? fontSizeName,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    double? lineHeight,
    double? letterSpacing,
  }) {
    final fonts = GoogleFonts.asMap();
    if (!fonts.containsKey(fontFamily)) {
      return TextStyle(color: color,);
    }
    return GoogleFonts.getFont(
    fontFamily,
    color: color,
    textStyle: fontSizeName?.materialTextStyle(themeData: Theme.of(context)),
    fontSize: fontSize,
    fontStyle: fontStyle,
    fontWeight: fontWeight,
    height: lineHeight,
    letterSpacing: letterSpacing,
  );
  }
}
