import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';

class MyGlobalObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    fco.logi('========================== ${event.runtimeType.toString()}');
    super.onEvent(bloc, event);
    // fco.logi('${bloc.runtimeType} $event');
  }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   super.onChange(bloc, change);
  //   fco.logi('${bloc.runtimeType} $change');
  // }
  //
  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   fco.logi('${bloc.runtimeType} $transition');
  // }
  //
  // @override
  // void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  //   fco.logi('${bloc.runtimeType} $error $stackTrace');
  //   super.onError(bloc, error, stackTrace);
  // }
}
