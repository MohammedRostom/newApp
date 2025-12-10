import 'package:auth_feature_1_0/config/routes/app_routes.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/rebo_abs/user_rebo_aps.dart';
import 'package:auth_feature_1_0/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // لازم قبل أي async
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocatorApp.AuthInitcalling();

  final repo = LocatorApp.sl<RepositoryAbs>();
  repo.registration(
    "AboRustom40",
    "AboRustom40@gmail.com",
    "AboRustom40@gmail.com",
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
