import 'package:auth_feature_1_0/features/auth_feature/pressentation/view/TestView.dart';
import 'package:auth_feature_1_0/features/auth_feature/pressentation/view/homepage_view.dart';
import 'package:auth_feature_1_0/features/auth_feature/pressentation/view/login_view.dart';
import 'package:auth_feature_1_0/features/auth_feature/pressentation/view/signup_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // ----------------------------------
  // Auth Feature Routes
  // ----------------------------------
  static final test = "test";
  static final login = "login";
  static final signup = "signup";
  static final homepage = "homepage";
  static Map<String, Widget Function(BuildContext)> MapOfViewsRouters = {
    test: (context) => TestView(),
    login: (context) => LoginView(),
    signup: (context) => SignupView(),
    homepage: (context) => HomepageView(),
  };
}
