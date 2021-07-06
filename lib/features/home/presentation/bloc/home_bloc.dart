import 'package:factories/core/data/models/factory.dart';
import 'package:factories/core/domain/usecase/usecase.dart';
import 'package:factories/features/home/presentation/bloc/home_event.dart';
import 'package:factories/features/home/presentation/bloc/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBLoC extends Bloc<HomeEvent, HomeState> {
  HomeBLoC(this._factoriesUseCase, this._logoutUseCase)
      : super(HomeState.initialState);

  final UseCase<List<Factory>, dynamic> _factoriesUseCase;
  final UseCase<void, dynamic> _logoutUseCase;

  late final ScrollController _controller;
  ScrollController get controller => _controller;

  Future<void> logout() async {
    await _logoutUseCase.call();
  }

  void init() {
    _controller = ScrollController();
    _controller.addListener(_listener);
  }

  void searchChanged(String search) {
    this.add(SearchEvent(search));
  }

  Future<void> loadFactory() async {
    final factories = await _factoriesUseCase.call();
    this.add(AddFactoriesEvent(factories));
  }

  void _listener() {
    final direction = _controller.position.userScrollDirection;
    if (direction == ScrollDirection.reverse)
      this.add(ShowButtonEvent(false));
    else if (direction == ScrollDirection.forward)
      this.add(ShowButtonEvent(true));
  }

  void _close() {
    _controller.removeListener(_listener);
    _controller.dispose();
  }

  void createFactory() {
    this.add(CreateFactoryEvent(HomeStatus.create));
  }

  Future<void> creatingFactory(Factory newFactory) async {
    this.add(AddingFactoryEvent());
    await Future.delayed(const Duration(seconds: 3));
    this.add(AddFactoryEvent(newFactory));
  }

  @override
  Future<void> close() {
    _close();
    return super.close();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is AddFactoriesEvent) {
      yield* _addFactoriesEvent(event);
    } else if (event is ShowButtonEvent) {
      yield* _showButtonEvent(event);
    } else if (event is CreateFactoryEvent) {
      yield* _createFactoryEvent(event);
    } else if (event is AddFactoryEvent) {
      yield* _addFactoryEvent(event);
    } else if (event is AddingFactoryEvent) {
      yield* _addingState(event);
    } else if (event is InitialStatus) {
      yield* _initialState(event);
    } else if (event is SearchEvent) {
      yield* _searchEvent(event);
    }
  }

  Stream<HomeState> _addFactoriesEvent(AddFactoriesEvent event) async* {
    yield state.copyWith(factories: event.factories, loading: false);
  }

  Stream<HomeState> _showButtonEvent(ShowButtonEvent event) async* {
    yield state.copyWith(showButton: event.showButton);
  }

  Stream<HomeState> _createFactoryEvent(CreateFactoryEvent event) async* {
    yield state.copyWith(status: event.status);
  }

  Stream<HomeState> _addFactoryEvent(AddFactoryEvent event) async* {
    List<Factory> factories = List<Factory>.from(state.factories);
    factories.add(event.newFactory);
    yield state.copyWith(
      loading: false,
      status: HomeStatus.ok,
      factories: factories,
    );
  }

  Stream<HomeState> _addingState(AddingFactoryEvent event) async* {
    yield state.copyWith(loading: true);
  }

  Stream<HomeState> _initialState(InitialStatus event) async* {
    yield state.copyWith(status: HomeStatus.initial);
  }

  Stream<HomeState> _searchEvent(SearchEvent event) async* {
    yield state.copyWith(search: event.search);
  }

  static HomeBLoC of(BuildContext context) =>
      BlocProvider.of<HomeBLoC>(context);
}
