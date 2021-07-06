import 'dart:io';

import 'package:equatable/equatable.dart';

class CreateFactoryState extends Equatable {
  const CreateFactoryState({
    required this.name,
    required this.description,
    this.photo,
    required this.formValid,
  });

  final String name;
  final String description;
  final File? photo;
  final bool formValid;

  static CreateFactoryState get initialState => const CreateFactoryState(
        name: '',
        description: '',
        formValid: false,
      );

  CreateFactoryState copyWith({
    String? name,
    String? description,
    File? photo,
    bool? formValid,
  }) =>
      CreateFactoryState(
        name: name ?? this.name,
        description: description ?? this.description,
        photo: photo ?? this.photo,
        formValid: formValid ?? this.formValid,
      );

  @override
  List<Object?> get props => [name, description, photo, formValid];
}
