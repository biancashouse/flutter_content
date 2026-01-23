import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/alignment_model.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_target_pointer_type.dart';

class TargetsWrapperOnTapMenu extends StatelessWidget {
  final TapUpDetails details;
  final TargetsWrapperNode parentNode;
  final TargetsWrapperState wrapperState;

  const TargetsWrapperOnTapMenu(
    this.details,
    this.parentNode,
    this.wrapperState, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool withHotspot = true;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: Colors.purpleAccent,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
              ),
              onPressed: () async {
                fco.dismissAll();
                _createHotspotTarget(context, details, withHotspot);
              },
              child: Text(
                'create a Target here',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Gap(16),
            StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      fco.coloredText(
                        'also create a hotspot ?',
                        color: Colors.white,
                      ),
                      Checkbox(
                        value: withHotspot,
                        onChanged: (_) {
                          setState(() {
                            withHotspot = !withHotspot;
                          });
                        },
                      ),
                    ],
                  ),
                  if (withHotspot)
                    Text(
                      '(user will be able to tap\nthe hotspot to play its callout)',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )
                  else
                    Text(
                      '(if no hotspot, its callout plays automatically)',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static double menuWidth() => 320.0;

  static double menuHeight() => 220.0;

  void _createHotspotTarget(
    BuildContext context,
    TapUpDetails details,
    bool withHotspot,
  ) {
    if (!fco.canEditContent()) return;
    SnippetName? snippetName = parentNode.rootNodeOfSnippet()?.name;
    if (snippetName == null) return;

    TargetId newTargetId = DateTime.now().millisecondsSinceEpoch;
    HotspotTargetModel newTC = HotspotTargetModel(
      uid: newTargetId,
      //event.wName.hashCode,
      tcAlignment: AlignmentModel(2, 0),
      calloutDurationMs: 2000,
      calloutFillColors: UpTo6Colors(color1: ColorModel.white()),
      targetPointerTypeEnum: TargetPointerTypeEnum.THIN,
    );

    newTC.setTargetLocalPosPc(wrapperState, details.globalPosition);

    if (withHotspot) {
      newTC.btnCLocalPosPc = newTC.targetCLocalPc;
      bool onLeft = newTC.targetCLocalPc!.dx < .5;
      newTC.btnCLocalPosPc = OffsetModel(
        newTC.targetCLocalPc!.dx + (onLeft ? .02 : -.02),
        newTC.targetCLocalPc!.dy,
      );
    }

    parentNode.targets = [...parentNode.targets, newTC];
    // widget.parentNode.targets.add(newTC);
    fco.capiBloc.add(const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
    // fco.modelRepo.saveNewVersionOfSnippet(parentNode.rootNodeOfSnippet()!);
    fco.appInfo.cachedSnippetInfo(parentNode.rootNodeOfSnippet()!.name)?.notifyChange(parentNode.rootNodeOfSnippet()!);
  }
}
