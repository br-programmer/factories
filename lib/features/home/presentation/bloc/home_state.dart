import 'package:equatable/equatable.dart';
import 'package:factories/core/data/models/factory.dart';

enum HomeStatus { initial, create, ok, detail }

class HomeState extends Equatable {
  const HomeState({
    required this.showButton,
    required this.status,
    required this.factories,
    required this.loading,
    required this.search,
  });

  final bool showButton;
  final HomeStatus status;
  final List<Factory> factories;
  final bool loading;
  final String search;

  static HomeState get initialState => const HomeState(
        showButton: true,
        status: HomeStatus.initial,
        factories: <Factory>[],
        loading: true,
        search: '',
      );

  HomeState copyWith({
    bool? showButton,
    HomeStatus? status,
    List<Factory>? factories,
    bool? loading,
    String? search,
  }) =>
      HomeState(
        showButton: showButton ?? this.showButton,
        status: status ?? this.status,
        factories: factories ?? this.factories,
        loading: loading ?? this.loading,
        search: search ?? this.search,
      );

  @override
  List<Object?> get props => [showButton, status, factories, loading, search];
}
