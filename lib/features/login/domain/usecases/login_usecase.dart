import 'package:factories/core/domain/repositories/persistent_storage_repository.dart';
import 'package:factories/core/domain/usecase/usecase.dart';
import 'package:factories/core/errors/auth_exception.dart';
import 'package:factories/features/login/domain/repositories/auth_repository.dart';
import 'package:factories/features/login/domain/request/login_request.dart';
import 'package:factories/features/login/domain/response/login_response.dart';

class LoginUseCase implements UseCase<LoginResponse, LoginRequest> {
  const LoginUseCase(this._authRepository, this._storageRepository);
  final AuthRepository _authRepository;
  final PersistentStorageRepository _storageRepository;

  @override
  Future<LoginResponse> call(LoginRequest params) async {
    try {
      final login = await _authRepository.login(params);
      if (login) await _storageRepository.savedSesion();
      return LoginResponse(status: login);
    } on AuthException catch (e) {
      return LoginResponse(status: false, exception: e);
    }
  }
}
