import 'package:factories/core/domain/repositories/persistent_storage_repository.dart';
import 'package:factories/core/domain/usecase/usecase.dart';

class SesionUseCase implements UseCase<bool, Type> {
  const SesionUseCase(this._storageRepository);
  final PersistentStorageRepository _storageRepository;
  @override
  Future<bool> call(_) async {
    await Future.delayed(const Duration(seconds: 3));
    return await _storageRepository.isLogin;
  }
}
