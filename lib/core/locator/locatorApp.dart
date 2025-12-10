import 'package:auth_feature_1_0/core/services/firebase_services/firebase_auth_service_abst.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/firebase_auth_service_impl.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/firebase_firestore_service_abst.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/firebase_firestore_service_impl.dart';
import 'package:get_it/get_it.dart';

class LocatorApp {
  static final sl = GetIt.instance;
  // -----------------------------------------------------------
  // AUTH SETUP
  // -----------------------------------------------------------
  static Future<void> setupSingltonAuth() async {
    sl.registerLazySingleton<FirebaseAuthServiceAbst>(
      () => FirebaseAuthServiceImpl(),
    );
    sl.registerLazySingleton<FireStoreServiceAbst>(
      () => FireStoreServiceImpl(),
    );
  }

  //  init calling
  static Future<void> AuthInitcalling() async {
    await setupSingltonAuth();

    print("✅ All registrations completed successfully");
  }
}
