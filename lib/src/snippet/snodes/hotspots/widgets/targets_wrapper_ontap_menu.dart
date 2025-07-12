import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/positioned_target_play_btn.dart';

class TargetsWrapperOnTapMenu extends StatelessWidget {
  final TapDownDetails details;
  final TargetsWrapperNode parentNode;
  final Rect wrapperRect;
  final ScrollControllerName? scName;

  const TargetsWrapperOnTapMenu(
      this.details, this.parentNode, this.wrapperRect, this.scName,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: getMenuItems(context),
        ),
      ),
    );
  }

  static double menuWidth() => 400.0;

  static double menuHeight() => 350.0;

  List<Widget> getMenuItems(context) {
    List<Widget> menuItems = [];

    // menuItems.add(Container(
    //     width: double.infinity,
    //     alignment: AlignmentEnum.topLeft,
    //     child: Icon(Icons.north_west)));

    menuItems.add(
      TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
        ),
        onPressed: () async {
          fco.removeParentCallout(context);
          await createTarget(details, true);
        },
        child: Text(
          'create a Target + Hotspot here',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );

    menuItems.add(Text(
      '(user will be able to tap\nthe hotspot to play its callout)',
      style: TextStyle(fontSize: 12, color: Colors.white),
    ));

    menuItems.add(SizedBox(
        width: double.infinity,
        child: Text(
          'or',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )));

    menuItems.add(
      TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
        ),
        onPressed: () async {
          fco.removeParentCallout(context);
          await createTarget(details, false);
        },
        child: Text(
          'create a Target here',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );

    menuItems.add(Text(
      '(callout will play automatically\nwhen page renders)',
      style: TextStyle(fontSize: 12, color: Colors.white),
    ));

    return menuItems
        .map((Widget mi) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: mi,
            ))
        .toList();
  }

  Future<void> createTarget(TapDownDetails details, bool withHotspot) async {
    if (!fco.authenticated.isTrue) return;
    SnippetName? snippetName = parentNode.rootNodeOfSnippet()?.name;
    if (snippetName == null) return;

    TargetId newTargetId = DateTime.now().millisecondsSinceEpoch;
    TargetModel newTC = TargetModel(
      uid: newTargetId, //event.wName.hashCode,
    )..parentTargetsWrapperNode = parentNode;
    Offset newGlobalPos = details.globalPosition.translate(
      NamedScrollController.hScrollOffset(scName),
      NamedScrollController.vScrollOffset(scName),
    );
    newTC.setTargetStackPosPc(
      newGlobalPos,
    );

    if (withHotspot) {
      newTC.btnLocalTopPc = newTC.targetLocalPosTopPc;
      bool onLeft = newTC.targetLocalPosLeftPc! < .5;
      newTC.btnLocalLeftPc =
          newTC.targetLocalPosLeftPc! + (onLeft ? .02 : -.02);
    } else {
      newTC.calloutDurationMs = 1000 * 60 * 60 * 24 * 365;
    }

    parentNode.targets = [...parentNode.targets, newTC];
    // widget.parentNode.targets.add(newTC);
    fco.capiBloc
        .add(const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));

    fco.saveNewVersion(snippet: parentNode.rootNodeOfSnippet()!);

    // fco.cacheAndSaveANewSnippetVersion(
    //   snippetName: snippetName,
    //   rootNode: parentNode.rootNodeOfSnippet()!,
    // );

    if (!withHotspot) {
      fco.afterMsDelayDo(1500, () {
        TargetPlayBtn.playTarget(newTC, wrapperRect, scName);
      });
    }
  }
}
