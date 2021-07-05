import 'package:equatable/equatable.dart';
import 'package:factories/features/login/presentation/bloc/bloc.dart';

abstract class LoginEvent extends Equatable {}

class ShowPassWordEvent implements LoginEvent {
  const ShowPassWordEvent(this.showPassword);
  final bool showPassword;

  @override
  List<Object?> get props => [showPassword];

  @override
  bool? get stringify => false;
}

class LogingStatusEvent implements LoginEvent {
  const LogingStatusEvent(this.status);
  final LoginStatus status;

  @override
  List<Object?> get props => [status];

  @override
  bool? get stringify => false;
}

class UserChangedEvent implements LoginEvent {
  const UserChangedEvent(this.userValid, this.user);
  final bool userValid;
  final String user;

  @override
  List<Object?> get props => [userValid, user];

  @override
  bool? get stringify => false;
}

class PasswordChangedEvent implements LoginEvent {
  const PasswordChangedEvent(this.passwordValid, this.password);
  final bool passwordValid;
  final String password;

  @override
  List<Object?> get props => [passwordValid, password];

  @override
  bool? get stringify => false;
}

class FormValidEvent implements LoginEvent {
  const FormValidEvent(this.formValid);
  final bool formValid;

  @override
  List<Object?> get props => [formValid];

  @override
  bool? get stringify => false;
}

class LoginError implements LoginEvent {
  const LoginError(this.error, this.status);
  final String error;
  final LoginStatus status;

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
