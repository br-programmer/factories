import 'package:factories/core/domain/usecase/usecase.dart';
import 'package:factories/features/splash/domain/usecase/sesion_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/core/data/repositories/persistent_storage_imp.dart';
import 'package:factories/core/domain/repositories/persistent_storage_repository.dart';

abstract class MyGlobalDependencies {
  static List<RepositoryProvider> buildDependencies() => <RepositoryProvider>[
        RepositoryProvider<PersistentStorageRepository>(
            create: (_) => PersistentStorageImpl()),
        RepositoryProvider<UseCase<bool, dynamic>>(
            create: (_) => SesionUseCase(_.read())),
      ];
}
