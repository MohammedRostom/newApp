import 'package:auth_feature_1_0/config/routes/routers.dart';
import 'package:auth_feature_1_0/features/auth_feature/pressentation/view/restPass_view.dart';
import 'package:auth_feature_1_0/features/auth_feature/pressentation/view/login_view.dart';
import 'package:auth_feature_1_0/features/auth_feature/pressentation/view/signup_view.dart';
import 'package:auth_feature_1_0/features/layout_feature/pressentation/view/homepage_view.dart';
import 'package:flutter/material.dart';

class AppViews {
  // ----------------------------------
  // Auth Feature Routes
  // ----------------------------------
  static Map<String, Widget Function(BuildContext)> MapOfViewsRouters = {
    loginRoute: (context) => LoginView(),
    signupRoute: (context) => SignupView(),
    resetPasswordRoute: (context) => ResetPasswordView(),
    // ----------------------------------
    // Layout Feature Routes
    // ----------------------------------
    homePageRoute: (context) => HomepageView(),
  };
}
