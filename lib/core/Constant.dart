import 'package:auth_feature_1_0/core/cache/cache.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/features/layout_feature/pressentation/view/Pag2.dart';
import 'package:auth_feature_1_0/features/layout_feature/pressentation/view/Pag3.dart';
import 'package:auth_feature_1_0/features/layout_feature/pressentation/view/Pag4.dart';
import 'package:auth_feature_1_0/features/layout_feature/pressentation/view/homepage_view.dart';
import 'package:auth_feature_1_0/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> setupServicesCall() async {
  WidgetsFlutterBinding.ensureInitialized(); // لازم قبل أي async
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFeaturesGetit();
  await PreferencesService.init();
}

class Constant {
  static final CollectionUsers = "users";
  static final mragin_screen_H = 16.w;
  static final double spaceHightBetweenElements = 17.h;
  static final double spaceWidthBetweenElements = 17.w;
  static final double spaceBetweenSections = 32.h;
  static fillContainerWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  // endPoint Or Paths
  static final String productsPath = "products";
  static final String getAllProductsUrl =
      "https://fakestoreapi.com/$productsPath";
  static final List<Map<String, dynamic>> Taps = [
    {"Icon": Icon(Icons.home_max_outlined), "label": "Home"},
    {"Icon": Icon(Icons.card_giftcard), "label": "Card"},
    {"Icon": Icon(Icons.favorite), "label": "Favorite"},
    {"Icon": Icon(Icons.person), "label": "Profile"},
  ];
  static final List<Widget> layoutPages = [
    HomepageView(),
    Pag2(),
    Pag3(),
    Pag4(),
  ];
}

// -------------------------------------------------------------
// ------------------ Widgets for Spacing ------------------
// -------------------------------------------------------------
class SpaceHeightBetweenElements extends StatelessWidget {
  const SpaceHeightBetweenElements({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Constant.spaceHightBetweenElements);
  }
}

class SpaceWidthtBetweenElements extends StatelessWidget {
  const SpaceWidthtBetweenElements({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: Constant.spaceWidthBetweenElements);
  }
}

class SpaceBetweenSections extends StatelessWidget {
  final double? spaceHeight; // final

  const SpaceBetweenSections({super.key, this.spaceHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spaceHeight ?? Constant.spaceBetweenSections);
  }
}
