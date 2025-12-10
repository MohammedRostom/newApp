import 'package:auth_feature_1_0/config/routes/app_routes.dart';
import 'package:auth_feature_1_0/core/Constant.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/firebase_auth_service_impl.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/firebase_firestore_service_impl.dart';
import 'package:auth_feature_1_0/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // لازم قبل أي async
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocatorApp.AuthInitcalling();

  await FireStoreServiceImpl().addAuthUserToFirestore(
    "Any",
    "Anykjlk@gmail.com",
    "Anykjlk@gmail.com",
    Constant.CollectionUsers,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.MapOfViewsRouters,
      initialRoute: AppRoutes.login,
    );
  }
}
