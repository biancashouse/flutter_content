// ignore_for_file: camel_case_types

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';

class TransformableScaffold extends StatefulWidget {
  final Widget suppliedScaffold;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  TransformableScaffold({
    required this.suppliedScaffold,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
  }) : super(key: GlobalKey(debugLabel: "TransformableScaffold"));

  static TransformableScaffoldState? of(BuildContext context) => context.findAncestorStateOfType<TransformableScaffoldState>();

  @override
  State<TransformableScaffold> createState() => TransformableScaffoldState();
}

class TransformableScaffoldState extends State<TransformableScaffold> with TickerProviderStateMixin, WidgetsBindingObserver {
  late MaterialSPAState? parentAppState;
  late Animation<Matrix4> _matrix4Animation;
  late AnimationController _aController;
  late Alignment _transformAlignment;
  // Rect? _rect;
  // double _scaleX = 1;
  // double _scaleY = 1;

  // called when refreshing from slider change (zero duration etc)
  zoomImmediately(final double scaleX, final double scaleY) {
    _matrix4Animation = Matrix4Tween(begin: Matrix4.identity(), end: Matrix4.identity()..scale(scaleX, scaleY)).animate(_aController);
    _aController.duration = Duration.zero;
    _aController
      ..reset
      ..forward().then((value) {
        _aController.duration = DEFAULT_TRANSITION_DURATION_MS;
      });
  }

  void applyTransform(final double scaleX, final double scaleY, final Alignment alignment, {required VoidCallback afterTransformF}) {
    _matrix4Animation = Matrix4Tween(begin: Matrix4.identity(), end: (Matrix4.identity()..scale(scaleX, scaleY))).animate(_aController);
    _transformAlignment = alignment;
    _aController.forward().then((value) => afterTransformF.call());
  }

  void resetTransform() {
    // _matrix4Animation = Matrix4Tween(begin: Matrix4.identity(), end: Matrix4.identity()).animate(_aController);
    _aController.reverse();
  }

  @override
  void initState() {
    super.initState();

    parentAppState = MaterialSPA.of(context);

    if (widget.ancestorHScrollController != null) CAPIState.registerScrollController(widget.ancestorHScrollController!);
    if (widget.ancestorVScrollController != null) CAPIState.registerScrollController(widget.ancestorVScrollController!);

    // make available globally
    // CAPIState.gkMap[widget.twName] = widget.key as GlobalKey;

    _aController = AnimationController(vsync: this);

    _aController.addListener(() {
      print("_aController status: ${_aController.status}");
      print("_aController status: ${_aController.toStringDetails()}");
    });

    // initially no transform
    _matrix4Animation = Matrix4Tween(
      begin: Matrix4.identity(),
      end: Matrix4.identity(),
    ).animate(_aController);

    _transformAlignment = Alignment.center;

    _initializeFields();
   }

  void _initializeFields() {
    _aController.duration = DEFAULT_TRANSITION_DURATION_MS;
  }

  @override
  void reassemble() {
    _initializeFields();
    super.reassemble();
  }

  @override
  dispose() {
    _aController.dispose();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   Useful.instance.initWithContext(context, force: true);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _aController,
        builder: (BuildContext context, _) {
          return Transform(
            transform: _matrix4Animation.value,
            alignment: _transformAlignment,
            child: _AnimatedScaffold(widget.suppliedScaffold),
          );
        });
  }
}

class _AnimatedScaffold extends StatelessWidget {
  final Widget scaffold;

  const _AnimatedScaffold(this.scaffold);

   @override
  Widget build(BuildContext context) {

    bool capiBlocRegistereredWithGetIt = true;
    try {
      CAPIBloC.I;
    } catch (e) {
      capiBlocRegistereredWithGetIt = false;
    }

    return capiBlocRegistereredWithGetIt
        ? BlocBuilder<CAPIBloC, CAPIState>(builder: (context, state) {
        return scaffold;
        // return Column(
        //   mainAxisSize: MainAxisSize.max,
        //   children: [
        //     AnimatedContainer(
        //       width: Useful.scrW,
        //       height: MaterialAppWrapper.inEditMode.value ? 40 : 0,
        //       color: Colors.purple,
        //       duration: const Duration(milliseconds: 300),
        //       child: MaterialAppWrapper.inEditMode.value ? const PanelChips() : const Offstage(),
        //     ),
        //     Expanded(
        //         child: scaffold
        //     ),
        //   ],
        // );
      },
    )
        : Text(
      'AnimatedScaffold - BLoC not registered!',
      style: Theme
          .of(context)
          .textTheme
          .displaySmall
          ?.copyWith(color: Colors.red),
    );
  }

  // Widget _panelEditButtons(context) {
  //   TransformableScaffoldState? parentTSState() => TransformableScaffold.of(context);
  //   return Material(
  //     child: Row(
  //       mainAxisSize: MainAxisSize.max,
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: CAPIState.snippetPanelGkMap.keys
  //           .map((panelName) => Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: TextButton(
  //                   style: ChoiceChip(
  //                     label: Text(panelName,
  //                     selected: _value == index,
  //                     onSelected: (bool selected) {
  //                       setState(() {
  //                         _value = selected ? index : null;
  //                       });
  //                     },
  //                   )
  //                   onPressed: () {
  //                     if (CAPIBloC.I.state.selectedPanel == panelName) {
  //                       Callout.dismiss('selected-panel-border-overlay');
  //                       CAPIBloC.I.add(const CAPIEvent.selectPanel(panelName: null));
  //                     } else if (CAPIBloC.I.state.selectedPanel != null) {
  //                       Callout.dismiss('selected-panel-border-overlay');
  //                     }
  //                     CAPIBloC.I.add(CAPIEvent.selectPanel(panelName: panelName));
  //                     // show an overlay for the panel (just a border)
  //                     _showPanelBorderOverlay(panelName);
  //                    },
  //                   onLongPress: () {
  //                     // show an overlay for the panel (just a border)
  //                     _showPanelBorderOverlay(panelName);
  //                     // create line connecting this text button to the panel overlay
  //                     // show the snippet tree callout for this panel
  //                     _showSnippetCallout(panelName);
  //                   },
  //                   child: Center(
  //                     child: Useful.coloredText(
  //                       panelName,
  //                       // '$panelName / ${CAPIState.snippetPlacementMap[panelName]}',
  //                       color: Colors.white,
  //                       fontSize: 14,
  //                     ),
  //                   ),
  //                 ),
  //               ))
  //           .toList(),
  //     ),
  //   );
  // }

}
