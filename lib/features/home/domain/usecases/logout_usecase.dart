import 'package:factories/core/domain/repositories/persistent_storage_repository.dart';
import 'package:factories/core/domain/usecase/usecase.dart';

class LogoutUseCase implements UseCase<void, dynamic> {
  const LogoutUseCase(this._storageRepository);
  final PersistentStorageRepository _storageRepository;

  @override
  Future<void> call({dynamic params}) async {
    await _storageRepository.logout();
  }
}
