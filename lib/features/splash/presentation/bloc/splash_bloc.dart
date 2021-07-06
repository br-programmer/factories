import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/core/domain/usecase/usecase.dart';
import 'package:factories/features/splash/presentation/bloc/splash_event.dart';
import 'package:factories/features/splash/presentation/bloc/splash_state.dart';

class SplashBLoC extends Bloc<SplashEvent, SplashState> {
  SplashBLoC(this._sesionUseCase) : super(SplashState.initialState);
  final UseCase<bool, dynamic> _sesionUseCase;

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is LoadingEvent) {
      yield* _loading(event);
    }
  }

  Stream<SplashState> _loading(LoadingEvent event) async* {
    final sesion = await _sesionUseCase.call();
    if (sesion)
      yield this.state.copywith(status: SplashStatus.login);
    else
      yield this.state.copywith(status: SplashStatus.logout);
  }
}
