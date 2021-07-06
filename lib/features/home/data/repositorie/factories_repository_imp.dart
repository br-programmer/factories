import 'package:factories/core/data/models/factory.dart';
import 'package:factories/features/home/data/in_memory_factories.dart';
import 'package:factories/features/home/domain/repositories/factories_repository.dart';

class FactoriesRespositoryImp implements FactoriesRepository {
  @override
  Future<List<Factory>> getFactories() async {
    await Future.delayed(const Duration(seconds: 3));
    return InMemoryFactories.factories;
  }
}
