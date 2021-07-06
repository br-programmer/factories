import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:factories/features/create_factory/presentation/bloc/create_factory_state.dart';

abstract class CreateFactoryEvent extends Equatable {}

class ChangedNameFactoryEvent implements CreateFactoryEvent {
  const ChangedNameFactoryEvent(this.name);
  final String name;

  @override
  List<Object?> get props => [name];

  @override
  bool? get stringify => false;
}

class ChangedDescriptionFactoryEvent implements CreateFactoryEvent {
  const ChangedDescriptionFactoryEvent(this.description);
  final String description;

  @override
  List<Object?> get props => [description];

  @override
  bool? get stringify => false;
}

class ChangedPhotoFactoryEvent implements CreateFactoryEvent {
  const ChangedPhotoFactoryEvent(this.photo);
  final File photo;

  @override
  List<Object?> get props => [photo];

  @override
  bool? get stringify => false;
}

class ChangedFormFactoryValidEvent implements CreateFactoryEvent {
  const ChangedFormFactoryValidEvent(this.formValid);
  final bool formValid;

  @override
  List<Object?> get props => [formValid];

  @override
  bool? get stringify => false;
}
