import 'package:auth_feature_1_0/config/routes/app_routes.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/core/services/firebase_services/auth_services/firebase_auth_service_impl.dart';
import 'package:auth_feature_1_0/features/auth_feature/Domain/usecases/user_usecase.dart';
import 'package:auth_feature_1_0/features/auth_feature/data/rebo_impl/user_rebo_impl.dart';
import 'package:auth_feature_1_0/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // لازم قبل أي async
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocatorApp.AuthInitcalling();
  // final paa = await RepositoryImpl(remoteUserDataSource: LocatorApp.sl());
  // print(
  //   paa.login(
  //     "mohammedrostomfree2712@gmail.com",
  //     "mohammedrostomfree2712@gmail.com",
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.MapOfViewsRouters,
        initialRoute: AppRoutes.login,
      ),
    );
  }
}
