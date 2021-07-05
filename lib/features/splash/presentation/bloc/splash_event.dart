import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {}

class LoadingEvent implements SplashEvent {
  const LoadingEvent();
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
