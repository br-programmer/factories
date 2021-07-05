import 'package:equatable/equatable.dart';

enum SplashStatus { initial, loading, login, logout }

class SplashState extends Equatable {
  const SplashState({required this.status});
  final SplashStatus status;

  static SplashState get initialState =>
      SplashState(status: SplashStatus.initial);

  SplashState copywith({SplashStatus? status}) =>
      SplashState(status: status ?? this.status);

  @override
  List<Object> get props => [status];
}
