import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';

class MyGlobalObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    fco.logger.i('========================== ${event.toString()}');
    super.onEvent(bloc, event);
    // fco.logger.i('${bloc.runtimeType} $event');
  }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   super.onChange(bloc, change);
  //   fco.logger.i('${bloc.runtimeType} $change');
  // }
  //
  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   fco.logger.i('${bloc.runtimeType} $transition');
  // }
  //
  // @override
  // void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  //   fco.logger.i('${bloc.runtimeType} $error $stackTrace');
  //   super.onError(bloc, error, stackTrace);
  // }
}
