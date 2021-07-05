import 'package:factories/core/domain/usecase/usecase.dart';
import 'package:factories/features/splash/domain/usecase/sesion_usecase.dart';
import 'package:factories/features/splash/presentation/bloc/splash_event.dart';
import 'package:factories/features/splash/presentation/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBLoC extends Bloc<SplashEvent, SplashState> {
  SplashBLoC(this._sesionUseCase) : super(SplashState.initialState);
  final UseCase<bool, Type> _sesionUseCase;

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is LoadingEvent) {
      yield* _loading(event);
    }
  }

  Stream<SplashState> _loading(LoadingEvent event) async* {
    final sesion = await _sesionUseCase.call(Type);
    if (sesion)
      yield this.state.copywith(status: SplashStatus.login);
    else
      yield this.state.copywith(status: SplashStatus.logout);
  }
}
