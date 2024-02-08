// ignore_for_file: camel_case_types

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

    if (widget.ancestorHScrollController != null) FC().registerScrollController(widget.ancestorHScrollController!);
    if (widget.ancestorVScrollController != null) FC().registerScrollController(widget.ancestorVScrollController!);

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
            child: BlocBuilder<CAPIBloC, CAPIState>(builder: (context, state) => widget.suppliedScaffold),
          );
        });
  }
}
