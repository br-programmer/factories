import 'package:factories/core/domain/usecase/usecase.dart';
import 'package:factories/features/login/data/repositories/auth_repository_imp.dart';
import 'package:factories/features/login/domain/repositories/auth_repository.dart';
import 'package:factories/features/login/domain/request/login_request.dart';
import 'package:factories/features/login/domain/response/login_response.dart';
import 'package:factories/features/login/domain/usecases/login_usecase.dart';
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
        RepositoryProvider<AuthRepository>(create: (_) => AuthRepositoryImp()),
        RepositoryProvider<UseCase<LoginResponse, LoginRequest>>(
            create: (_) => LoginUseCase(_.read(), _.read())),
      ];
}
