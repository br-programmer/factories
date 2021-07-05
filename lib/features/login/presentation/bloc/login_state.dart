import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, error, ok }

class LoginState extends Equatable {
  const LoginState({
    required this.user,
    required this.password,
    required this.userValid,
    required this.passwordValid,
    required this.showPassword,
    required this.status,
    required this.formValid,
    required this.error,
  });

  final String user;
  final String password;
  final bool userValid;
  final bool passwordValid;
  final bool showPassword;
  final LoginStatus status;
  final bool formValid;
  final String error;

  static LoginState get initialState => LoginState(
        user: '',
        password: '',
        userValid: true,
        passwordValid: true,
        showPassword: false,
        status: LoginStatus.initial,
        formValid: false,
        error: '',
      );

  LoginState copyWith({
    String? user,
    String? password,
    bool? userValid,
    bool? passwordValid,
    bool? showPassword,
    LoginStatus? status,
    bool? formValid,
    String? error,
  }) =>
      LoginState(
        user: user ?? this.user,
        password: password ?? this.password,
        showPassword: showPassword ?? this.showPassword,
        userValid: userValid ?? this.userValid,
        passwordValid: passwordValid ?? this.passwordValid,
        status: status ?? this.status,
        formValid: formValid ?? this.formValid,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [
        user,
        password,
        userValid,
        passwordValid,
        showPassword,
        status,
        formValid,
      ];
}
