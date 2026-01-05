import 'package:auth_feature_1_0/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartManger extends StatelessWidget {
  const StartManger({super.key});

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
