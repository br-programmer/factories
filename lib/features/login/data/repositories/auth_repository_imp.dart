import 'package:factories/core/errors/auth_exception.dart';
import 'package:factories/features/login/domain/repositories/auth_repository.dart';
import 'package:factories/features/login/domain/request/login_request.dart';

class AuthRepositoryImp implements AuthRepository {
  @override
  Future<bool> login(LoginRequest request) async {
    await Future.delayed(const Duration(seconds: 3));
    if (request.user == 'Brayan' && request.password == 'Br1997C') {
      return true;
    } else if (request.user == 'John' && request.password == 'Betts2021') {
      return true;
    }
    throw UserOrPasswordInvalid('User or password incorrect');
  }
}
