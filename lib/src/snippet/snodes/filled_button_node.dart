// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_group.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';
import 'package:get_it/get_it.dart';

part 'filled_button_node.mapper.dart';

@MappableClass()
class FilledButtonNode extends ButtonNode with FilledButtonNodeMappable {
  FilledButtonNode({
    super.buttonStyleGroup,
    super.onTapHandlerName,
    super.calloutConfigGroup,
    super.child,
  });

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    ButtonStyle? btnStyle = buttonStyleGroup?.toButtonStyle(context);
    // possible handler
    void Function(BuildContext)? f = onTapHandlerName != null ? SnippetPanel.namedHandler(onTapHandlerName!) : null;
    // possible callout
    Feature? feature = calloutConfigGroup?.contentSnippetName;

    parent = parentNode; // propagating parents down from root
    possiblyHighlightSelectedNode(context);

    return Container(
      // container only for possble selection gk
      key: nodeWidgetGK,
      child: FilledButton(
        // if feature specified, must be a callout
        key: feature != null ? GetIt.I.get<GKMap>(instanceName: getIt_calloutGKs)[feature] = GlobalKey() : null,
        onPressed: () async {
          if (feature != null) {
            // Widget contents = SnippetPanel(sName: calloutConfig!.contentSnippetName!);
            Future.delayed(
              const Duration(seconds: 1),
              () => Callout.showOverlay(
                  targetGkF: () => GetIt.I.get<GKMap>(instanceName: getIt_calloutGKs)[feature],
                  boxContentF: (_) => SnippetPanel(
                        panelName: calloutConfigGroup!.contentSnippetName!,
                        snippetName: BODY_PLACEHOLDER,
                        allowButtonCallouts: false,
                      ),
                  calloutConfig: CalloutConfig(
                    feature: feature,
                    initialTargetAlignment: calloutConfigGroup!.targetAlignment != null
                        ? calloutConfigGroup!.targetAlignment!.flutterValue
                        : AlignmentEnum.bottomRight.flutterValue,
                    initialCalloutAlignment: calloutConfigGroup!.targetAlignment != null
                        ? calloutConfigGroup!.targetAlignment!.oppositeEnum.flutterValue
                        : AlignmentEnum.topLeft.flutterValue,
                    suppliedCalloutW: 200,
                    suppliedCalloutH: 150,
                    arrowType: calloutConfigGroup!.arrowType?.flutterValue ?? ArrowType.POINTY,
                    finalSeparation: 100,
                    barrier: CalloutBarrier(
                      opacity: 0.1,
                      onTappedF: () async {
                        Callout.dismiss(feature);
                      },
                    ),
                    color: calloutConfigGroup?.color ?? Colors.white,
                  )),
            );
          }
        },
        onLongPress: f != null ? () => f.call(context) : null,
        style: btnStyle,
        child: child?.toWidget(context, this),
      ),
    );
  }

  @override
  String toSource(BuildContext context) {
    return '''FilledButton(
    onPressed: null,
    style: ${buttonStyleGroup?.toButtonStyleSource(context)},
    child: ${child?.toSource(context) ?? const Text(
              "missing FilledButton child!",
              style: TextStyle(color: Colors.red),
            )},
  )''';
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "FilledButton";
}
