import 'package:factories/features/login/domain/request/login_request.dart';

abstract class AuthRepository {
  Future<bool> login(LoginRequest request);
}
