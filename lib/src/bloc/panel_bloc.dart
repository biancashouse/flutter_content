// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
//
// import 'panel_event.dart';
// import 'panel_state.dart';
//
// class PanelBloC extends Bloc<PanelEvent, PanelState> {
//   PanelBloC() : super(PanelState()) {
//     on<Refresh>((event, emit) => _refresh(event, emit));
//   }
//
//   Future<void> _refresh(event, emit) async {
//     emit(state.copyWith(
//       force: state.force + 1,
//     ));
//   }
// }