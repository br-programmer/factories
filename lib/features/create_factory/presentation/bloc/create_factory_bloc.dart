import 'package:factories/core/data/models/factory.dart';
import 'package:factories/core/domain/repositories/image_picker_repository.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/features/create_factory/presentation/bloc/create_factory_event.dart';
import 'package:factories/features/create_factory/presentation/bloc/create_factory_state.dart';

class CreateFactoryBLoC extends Bloc<CreateFactoryEvent, CreateFactoryState> {
  CreateFactoryBLoC(this._pickerRepository)
      : super(CreateFactoryState.initialState);
  final ImagePickerRepository _pickerRepository;

  Factory get newFactory => Factory(
        name: state.name,
        description: state.description,
        file: state.photo,
      );

  void changedName(String name) {
    this.add(ChangedNameFactoryEvent(name));
    _formValid(Helpers.nameValid(name),
        Helpers.descriptionValid(state.description), state.photo != null);
  }

  void changedDescription(String description) {
    this.add(ChangedDescriptionFactoryEvent(description));
    _formValid(Helpers.nameValid(state.name),
        Helpers.descriptionValid(description), state.photo != null);
  }

  Future<void> pickerImage() async {
    final file = await _pickerRepository.pickImage();
    print(file);
    if (file != null) this.add(ChangedPhotoFactoryEvent(file));
  }

  Future<void> takePhoto() async {
    final file = await _pickerRepository.takePhoto();
    if (file != null) this.add(ChangedPhotoFactoryEvent(file));
  }

  void _formValid(bool nameValid, bool descriptionValid, bool photoSelected) {
    this.add(ChangedFormFactoryValidEvent(
        nameValid && descriptionValid && photoSelected));
  }

  @override
  Stream<CreateFactoryState> mapEventToState(CreateFactoryEvent event) async* {
    if (event is ChangedNameFactoryEvent) {
      yield* _changedName(event);
    } else if (event is ChangedDescriptionFactoryEvent) {
      yield* _changedDescription(event);
    } else if (event is ChangedPhotoFactoryEvent) {
      yield* _changedPhoto(event);
    } else if (event is ChangedFormFactoryValidEvent) {
      yield* _changedForm(event);
    }
  }

  Stream<CreateFactoryState> _changedName(
      ChangedNameFactoryEvent event) async* {
    yield state.copyWith(name: event.name);
  }

  Stream<CreateFactoryState> _changedDescription(
      ChangedDescriptionFactoryEvent event) async* {
    yield state.copyWith(description: event.description);
  }

  Stream<CreateFactoryState> _changedPhoto(
      ChangedPhotoFactoryEvent event) async* {
    yield state.copyWith(photo: event.photo);
  }

  Stream<CreateFactoryState> _changedForm(
      ChangedFormFactoryValidEvent event) async* {
    yield state.copyWith(formValid: event.formValid);
  }

  static CreateFactoryBLoC of(BuildContext context) =>
      BlocProvider.of<CreateFactoryBLoC>(context);
}
