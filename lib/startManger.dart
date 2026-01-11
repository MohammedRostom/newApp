import 'package:auth_feature_1_0/config/routes/app_views.dart';
import 'package:auth_feature_1_0/config/routes/routers.dart';
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
        routes: AppViews.MapOfViewsRouters,
        initialRoute: loginRoute,
      ),
    );
  }
}
