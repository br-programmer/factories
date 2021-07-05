import 'package:equatable/equatable.dart';

class AuthException implements Exception, Equatable {
  final message;
  final prefix;

  AuthException([this.message, this.prefix]);

  @override
  List<Object> get props => [message, prefix];

  @override
  bool get stringify => true;

  String toString() => '$prefix $message';
}

class UserOrPasswordInvalid extends AuthException {
  UserOrPasswordInvalid(String message)
      : super(message, 'Error in the authentication');
}
