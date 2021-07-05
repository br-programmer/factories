import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/features/login/presentation/bloc/login_event.dart';
import 'package:factories/features/login/presentation/bloc/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBLoC extends Bloc<LoginEvent, LoginState> {
  LoginBLoC() : super(LoginState.initialState);

  void onChangedUser(String user) {
    final userValid = Helpers.userValid(user);
    this.add(UserChangedEvent(userValid, user));
    _formValid(userValid, Helpers.isValidPassword(state.password));
  }

  void onChangedPassword(String password) {
    final passwordValid = Helpers.isValidPassword(password);
    this.add(PasswordChangedEvent(passwordValid, password));
    _formValid(Helpers.userValid(state.user), passwordValid);
  }

  void changedShowPassword() {
    this.add(ShowPassWordEvent(!state.showPassword));
  }

  void _formValid(bool userValid, bool passwordValid) {
    this.add(FormValidEvent(userValid && passwordValid));
  }

  Future<void> login() async {
    this.add(LogingStatusEvent(LoginStatus.loading));
    await Future.delayed(const Duration(seconds: 5));
    this.add(LogingStatusEvent(LoginStatus.error));
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is ShowPassWordEvent) {
      yield* _showPassWordEvent(event);
    } else if (event is UserChangedEvent) {
      yield* _userValidEvent(event);
    } else if (event is PasswordChangedEvent) {
      yield* _passwordValidEvent(event);
    } else if (event is FormValidEvent) {
      yield* _formValidEvent(event);
    } else if (event is LogingStatusEvent) {
      yield* _loginStatusEvent(event);
    } else if (event is LoginError) {
      yield* _loginErrorEvent(event);
    }
  }

  Stream<LoginState> _showPassWordEvent(ShowPassWordEvent event) async* {
    yield state.copyWith(showPassword: event.showPassword);
  }

  Stream<LoginState> _userValidEvent(UserChangedEvent event) async* {
    yield state.copyWith(
      userValid: event.userValid,
      user: event.user,
    );
  }

  Stream<LoginState> _passwordValidEvent(PasswordChangedEvent event) async* {
    yield state.copyWith(
      passwordValid: event.passwordValid,
      password: event.password,
    );
  }

  Stream<LoginState> _formValidEvent(FormValidEvent event) async* {
    yield state.copyWith(formValid: event.formValid);
  }

  Stream<LoginState> _loginStatusEvent(LogingStatusEvent event) async* {
    yield state.copyWith(status: event.status);
  }

  Stream<LoginState> _loginErrorEvent(LoginError event) async* {
    yield state.copyWith(status: event.status, error: event.error);
  }

  static LoginBLoC of(BuildContext context) =>
      BlocProvider.of<LoginBLoC>(context);
}
