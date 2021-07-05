import 'package:factories/core/data/models/factory.dart';
import 'package:factories/features/home/presentation/bloc/home_event.dart';
import 'package:factories/features/home/presentation/bloc/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBLoC extends Bloc<HomeEvent, HomeState> {
  HomeBLoC() : super(HomeState.initialState);

  late final ScrollController _controller;
  ScrollController get controller => _controller;

  void init() {
    _controller = ScrollController();
    _controller.addListener(_listener);
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
    this.add(CreateFactoryEvent(HomeStatus.creating));
    // TODO: ADD LOGIN FOR ADD NEWFACTORY TO LIST<FACTORY>
    await Future.delayed(const Duration(seconds: 2));
    this.add(CreateFactoryEvent(HomeStatus.ok));
  }

  void detailFactory() {
    print('detail');
    this.add(CreateFactoryEvent(HomeStatus.detail));
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
    } else if (event is DetailFactoryEvent) {
      yield* _detailFactoryEvent(event);
    }
  }

  Stream<HomeState> _addFactoriesEvent(AddFactoriesEvent event) async* {
    yield state.copyWith(factories: event.factories);
  }

  Stream<HomeState> _showButtonEvent(ShowButtonEvent event) async* {
    yield state.copyWith(showButton: event.showButton);
  }

  Stream<HomeState> _createFactoryEvent(CreateFactoryEvent event) async* {
    yield state.copyWith(status: event.status);
  }

  Stream<HomeState> _detailFactoryEvent(DetailFactoryEvent event) async* {
    yield state.copyWith(status: event.status);
  }

  static HomeBLoC of(BuildContext context) =>
      BlocProvider.of<HomeBLoC>(context);
}
