import 'package:flutter/widgets.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/core/domain/usecase/usecase.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/features/login/domain/request/login_request.dart';
import 'package:factories/features/login/domain/response/login_response.dart';
import 'package:factories/features/login/presentation/bloc/login_event.dart';
import 'package:factories/features/login/presentation/bloc/login_state.dart';

class LoginBLoC extends Bloc<LoginEvent, LoginState> {
  LoginBLoC(this._useCase) : super(LoginState.initialState);
  final UseCase<LoginResponse, LoginRequest> _useCase;

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
    final response = await _useCase.call(
      LoginRequest(user: state.user, password: state.password),
    );
    if (response.status) {
      this.add(LogingStatusEvent(LoginStatus.ok));
    } else {
      this.add(LoginError(response.exception!.message, LoginStatus.error));
    }
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
