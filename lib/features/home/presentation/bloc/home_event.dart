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

class DetailFactoryEvent implements HomeEvent {
  const DetailFactoryEvent(this.status, this.factor);
  final HomeStatus status;
  final Factory factor;

  @override
  List<Object?> get props => [status, factor];

  @override
  bool? get stringify => false;
}
