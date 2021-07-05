import 'package:equatable/equatable.dart';
import 'package:factories/core/data/models/factory.dart';

enum HomeStatus { initial, create, creating, ok, detail }

class HomeState extends Equatable {
  const HomeState({
    required this.showButton,
    required this.status,
    required this.factories,
  });

  final bool showButton;
  final HomeStatus status;
  final List<Factory> factories;

  static HomeState get initialState => const HomeState(
        showButton: true,
        status: HomeStatus.initial,
        factories: <Factory>[],
      );

  HomeState copyWith(
          {bool? showButton, HomeStatus? status, List<Factory>? factories}) =>
      HomeState(
        showButton: showButton ?? this.showButton,
        status: status ?? this.status,
        factories: factories ?? this.factories,
      );

  @override
  List<Object?> get props => [showButton, status, factories];
}
