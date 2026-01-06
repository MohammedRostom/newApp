import 'package:auth_feature_1_0/core/Conenction/checKNet.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/auth_services/firebase_auth_service_abst.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/auth_services/firebase_auth_service_impl.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/firestore_services/firebase_firestore_service_abst.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/firestore_services/firebase_firestore_service_impl.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/getUser_rebo_aps.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/user_rebo_aps.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/usecases/getUser_usecase.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/datasource/remote/getUser_datasource.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/datasource/remote/user_datasource.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/rebo_impl/getUser_rebo_impl.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/rebo_impl/user_rebo_impl.dart';
import 'package:auth_feature_1_0/features/auth_feature/domain/usecases/user_usecase.dart';
import 'package:auth_feature_1_0/features/auth_feature/pressentation/viewmodel/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final gtit = GetIt.instance;
// -----------------------------------------------------------
// AUTH SETUP
// -----------------------------------------------------------
Future<void> setupAuthFeature() async {
  // Abs , Impl
  gtit.registerLazySingleton<FirebaseAuthServiceAbst>(
    () => FirebaseAuthServiceImpl(firebaseStore: gtit()),
  );
  gtit.registerLazySingleton<FireStoreServiceAbst>(
    () => FireStoreServiceImpl(),
  );

  // DataSource
  // Depandency inversion
  gtit.registerLazySingleton<RemoteUserDataSource>(
    () => RemoteUserDataSource(firebaseAuthServiceAbs: gtit()),
  );
  gtit.registerLazySingleton<GetUserDatasource>(
    () => GetUserDatasource(fireStoreService: gtit()),
  );

  // Abs , Impl
  gtit.registerLazySingleton<RepositoryAbs>(
    () => RepositoryImpl(remoteUserDataSource: gtit()),
  );
  gtit.registerLazySingleton<GetUserReboAps>(
    () => GetRepositoryImpl(remoteUserDataSource: gtit()),
  );
  // gtit.registerLazySingleton<UserUseCase>(
  //   () => UserUseCase(repositoryAbs: gtit()),
  // );
  // UseCases
  gtit.registerLazySingleton<GetUserUsecase>(
    () => GetUserUsecase(getUserReboAps: gtit()),
  );

  // Cubits
  gtit.registerFactory<AuthCubit>(
    () => AuthCubit(getUserUseCase: gtit(), connectionChecker: gtit()),
  );
  gtit.registerFactory<CheckConnection>(() => CheckConnection());
  await gtit.allReady();
}

//  init calling
Future<void> setupFeaturesGetit() async {
  await setupAuthFeature();

  print("✅ All registrations completed successfully");
}
