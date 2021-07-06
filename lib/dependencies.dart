import 'package:factories/features/home/domain/usecases/logout_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/core/domain/repositories/image_picker_repository.dart';
import 'package:factories/core/data/repositories/image_picker_imp.dart';
import 'package:factories/core/data/repositories/persistent_storage_imp.dart';
import 'package:factories/core/data/models/factory.dart';
import 'package:factories/core/domain/repositories/persistent_storage_repository.dart';
import 'package:factories/core/domain/usecase/usecase.dart';
import 'package:factories/features/home/data/repositorie/factories_repository_imp.dart';
import 'package:factories/features/home/domain/repositories/factories_repository.dart';
import 'package:factories/features/home/domain/usecases/factories_usecase.dart';
import 'package:factories/features/login/data/repositories/auth_repository_imp.dart';
import 'package:factories/features/login/domain/repositories/auth_repository.dart';
import 'package:factories/features/login/domain/request/login_request.dart';
import 'package:factories/features/login/domain/response/login_response.dart';
import 'package:factories/features/login/domain/usecases/login_usecase.dart';
import 'package:factories/features/splash/domain/usecase/sesion_usecase.dart';

abstract class MyGlobalDependencies {
  static List<RepositoryProvider> buildDependencies() => <RepositoryProvider>[
        RepositoryProvider<PersistentStorageRepository>(
            create: (_) => PersistentStorageImpl()),
        RepositoryProvider<UseCase<bool, dynamic>>(
            create: (_) => SesionUseCase(_.read())),
        RepositoryProvider<AuthRepository>(create: (_) => AuthRepositoryImp()),
        RepositoryProvider<UseCase<LoginResponse, LoginRequest>>(
            create: (_) => LoginUseCase(_.read(), _.read())),
        RepositoryProvider<FactoriesRepository>(
            create: (_) => FactoriesRespositoryImp()),
        RepositoryProvider<UseCase<List<Factory>, dynamic>>(
            create: (_) => FactoriesUseCase(_.read())),
        RepositoryProvider<ImagePickerRepository>(
            create: (_) => ImagePickerImpl()),
        RepositoryProvider<UseCase<void, dynamic>>(
            create: (_) => LogoutUseCase(_.read())),
      ];
}
