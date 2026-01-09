import 'package:auth_feature_1_0/core/Conenction/checKNet.dart';
import 'package:auth_feature_1_0/core/Conenction/cubit/test_network_cubit.dart';
import 'package:auth_feature_1_0/core/services/api_services/abi_services.dart';
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
import 'package:auth_feature_1_0/features/auth_feature/pressentation/viewmodel/cubit/auth_cubit.dart';
import 'package:auth_feature_1_0/features/layout_feature/Domain/rebo_abs/products_rebo_abs.dart';
import 'package:auth_feature_1_0/features/layout_feature/Domain/usecases/Products_usecase.dart';
import 'package:auth_feature_1_0/features/layout_feature/Domain/usecases/products_usecase.dart' hide ProductsUsecase;
import 'package:auth_feature_1_0/features/layout_feature/data/datasource/remote/Products_datasource_abs.dart';
import 'package:auth_feature_1_0/features/layout_feature/data/datasource/remote/Products_datasource_impl.dart';
import 'package:auth_feature_1_0/features/layout_feature/data/rebo_impl/products_rebo_impl.dart';
import 'package:auth_feature_1_0/features/layout_feature/pressentation/viewmodel/cubit/product_cubit.dart';
import 'package:get_it/get_it.dart';

final gtit = GetIt.instance;
// -----------------------------------------------------------
// AUTH SETUP
// -----------------------------------------------------------
Future<void> setupAuthFeature() async {
  // -----------------------------------------------------------
  // Abs , Impl Services
  gtit.registerLazySingleton<FirebaseAuthServiceAbst>(
    () => FirebaseAuthServiceImpl(firebaseStore: gtit()),
  );
  gtit.registerLazySingleton<FireStoreServiceAbst>(
    () => FireStoreServiceImpl(),
  );
  // -----------------------------------------------------------
  //  Depandency inversion DataSource
  gtit.registerLazySingleton<RemoteUserDataSource>(
    () => RemoteUserDataSource(firebaseAuthServiceAbs: gtit()),
  );
  gtit.registerLazySingleton<GetUserDatasource>(
    () => GetUserDatasource(fireStoreService: gtit()),
  );
  // -----------------------------------------------------------
  // Abs , Impl Repository
  gtit.registerLazySingleton<RepositoryAbs>(
    () => RepositoryImpl(remoteUserDataSource: gtit()),
  );
  gtit.registerLazySingleton<GetUserReboAps>(
    () => GetRepositoryImpl(remoteUserDataSource: gtit()),
  );
  // -----------------------------------------------------------
  // UseCases
  // gtit.registerLazySingleton<UserUseCase>(
  //   () => UserUseCase(repositoryAbs: gtit()),
  // );

  gtit.registerLazySingleton<GetUserUsecase>(
    () => GetUserUsecase(getUserReboAps: gtit()),
  );
  // -----------------------------------------------------------
  // Cubits
  gtit.registerFactory<AuthCubit>(
    () => AuthCubit(getUserUseCase: gtit(), connectionChecker: gtit()),
  );
  // Network
  gtit.registerFactory<TestNetworkCubit>(
    () => TestNetworkCubit(checker: gtit()),
  );
  gtit.registerFactory<CheckConnection>(() => CheckConnection());
  await gtit.allReady();
}

// -----------------------------------------------------------
// Products SETUP
// -----------------------------------------------------------
Future<void> setupProductsFeature() async {
  gtit.registerLazySingleton<ApiServices>(() => ApiServices());
  gtit.registerLazySingleton<ProductsDatasourceAbs>(
    () => ProductsDatasourceImpl(apiServices: gtit()),
  );
  gtit.registerLazySingleton<ProductsReboAbs>(
    () => ProductsReboImpl(productsDatasourceAbs: gtit()),
  );
  gtit.registerLazySingleton<ProductsUsecase>(
    () => ProductsUsecase(productsReboAbs: gtit()),
  );
  gtit.registerFactory<ProductCubit>(
    () => ProductCubit(productsUsecase: gtit()),
  );
  await gtit.allReady();
}

// -----------------------------------------------------------
//  init calling
Future<void> setupFeaturesGetit() async {
  await setupAuthFeature();
  print("✅ All setupAuthFeature registered successfully");
  await setupProductsFeature();
  print("✅ All setupProductFeature registered successfully");
}
