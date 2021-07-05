import 'package:factories/features/splash/presentation/bloc/splash_event.dart';
import 'package:factories/features/splash/presentation/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBLoC extends Bloc<SplashEvent, SplashState> {
  SplashBLoC() : super(SplashState.initialState);

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is LoadingEvent) {
      yield* _loading(event);
    }
  }

  Stream<SplashState> _loading(LoadingEvent event) async* {
    // TODO: VALIDATE SESION
  }
}
