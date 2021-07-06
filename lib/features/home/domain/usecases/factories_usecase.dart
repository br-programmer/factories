import 'package:factories/core/data/models/factory.dart';
import 'package:factories/core/domain/usecase/usecase.dart';
import 'package:factories/features/home/domain/repositories/factories_repository.dart';

class FactoriesUseCase implements UseCase<List<Factory>, dynamic> {
  const FactoriesUseCase(this._factoriesRepository);
  final FactoriesRepository _factoriesRepository;

  @override
  Future<List<Factory>> call({dynamic params}) async {
    return await _factoriesRepository.getFactories();
  }
}
