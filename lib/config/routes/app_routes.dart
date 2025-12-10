import 'package:auth_feature_1_0/features/auth_feature/pressentation/view/loginscreen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // ----------------------------------
  // Auth Feature Routes
  // ----------------------------------
  static final login = "login";
  static Map<String, Widget Function(BuildContext)> MapOfViewsRouters = {
    login: (context) => LoginView(),
  };
}
