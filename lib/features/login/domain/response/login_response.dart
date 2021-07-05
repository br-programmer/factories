import 'package:factories/core/errors/auth_exception.dart';

class LoginResponse {
  const LoginResponse({required this.status, this.exception});
  final bool status;
  final AuthException? exception;
}
