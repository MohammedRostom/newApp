import 'package:auth_feature_1_0/core/Conenction/checKNet.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/auth_services/firebase_auth_service_abst.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/auth_services/firebase_auth_service_impl.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/firestore_services/firebase_firestore_service_abst.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/firebase_firestore_service_impl.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/user_rebo_aps.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/datasource/remote/user_datasource.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/rebo_impl/user_rebo_impl.dart';
import 'package:auth_feature_1_0/features/auth_feature/domain/usecases/user_usecase.dart';
import 'package:auth_feature_1_0/features/auth_feature/pressentation/viewmodel/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

class LoactorApp {
  static final sl = GetIt.instance;
  // -----------------------------------------------------------
  // AUTH SETUP
  // -----------------------------------------------------------
  static Future<void> setupSingltonAuth() async {
    // Abs , Impl
    sl.registerLazySingleton<FirebaseAuthServiceAbst>(
      () => FirebaseAuthServiceImpl(firebaseStore: sl()),
    );
    sl.registerLazySingleton<FireStoreServiceAbst>(
      () => FireStoreServiceImpl(),
    );
    // Depandency inversion
    sl.registerLazySingleton<RemoteUserDataSource>(
      () => RemoteUserDataSource(firebaseAuthServiceAbs: sl()),
    );
    // Abs , Impl
    sl.registerLazySingleton<RepositoryAbs>(
      () => RepositoryImpl(remoteUserDataSource: sl()),
    );
    sl.registerLazySingleton<UserUseCase>(
      () => UserUseCase(repositoryAbs: sl()),
    );
    sl.registerFactory<CheckConnection>(() => CheckConnection());
    sl.registerFactory<AuthCubit>(() => AuthCubit(connectionChecker: sl()));
  }

  //  init calling
  static Future<void> AuthInitcalling() async {
    await setupSingltonAuth();

    print("✅ All registrations completed successfully");
  }
}
