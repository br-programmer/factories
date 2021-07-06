import 'package:factories/core/data/models/factory.dart';

abstract class FactoriesRepository {
  Future<List<Factory>> getFactories();
}
