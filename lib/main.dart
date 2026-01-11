import 'package:auth_feature_1_0/core/Constant.dart';
import 'package:auth_feature_1_0/core/cache/cache.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/core/services/api_services/abi_services.dart';
import 'package:auth_feature_1_0/features/layout_feature/Domain/usecases/products_usecase.dart';
import 'package:auth_feature_1_0/features/layout_feature/data/datasource/remote/Products_datasource_impl.dart';
import 'package:auth_feature_1_0/features/layout_feature/data/rebo_impl/products_rebo_impl.dart';
import 'package:auth_feature_1_0/firebase_options.dart';
import 'package:auth_feature_1_0/startManger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupServicesCall();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StartManger();
  }
}
