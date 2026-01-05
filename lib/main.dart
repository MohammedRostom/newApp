import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/firebase_options.dart';
import 'package:auth_feature_1_0/startManger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // لازم قبل أي async
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFeaturesGetit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StartManger();
  }
}
