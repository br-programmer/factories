import 'package:equatable/equatable.dart';
import 'package:factories/core/data/models/factory.dart';
import 'package:factories/features/home/presentation/bloc/bloc.dart';

abstract class HomeEvent extends Equatable {}

class AddFactoriesEvent implements HomeEvent {
  const AddFactoriesEvent(this.factories);
  final List<Factory> factories;
  @override
  List<Object?> get props => [factories];

  @override
  bool? get stringify => false;
}

class ShowButtonEvent implements HomeEvent {
  const ShowButtonEvent(this.showButton);
  final bool showButton;

  @override
  List<Object?> get props => [showButton];

  @override
  bool? get stringify => false;
}

class CreateFactoryEvent implements HomeEvent {
  const CreateFactoryEvent(this.status);
  final HomeStatus status;

  @override
  List<Object?> get props => [status];

  @override
  bool? get stringify => false;
}

class AddingFactoryEvent implements HomeEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class AddFactoryEvent implements HomeEvent {
  const AddFactoryEvent(this.newFactory);
  final Factory newFactory;

  @override
  List<Object?> get props => [newFactory];

  @override
  bool? get stringify => false;
}

class InitialStatus implements HomeEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
