import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constant {
  static final CollectionUsers = "users";
  static final mragin_screen_H = 16.w;
  static final double spaceHightBetweenElements = 16.h;
  static final double spaceWidthBetweenElements = 16.w;
  static final double spaceBetweenSections = 32.h;
  static fillContainerWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
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
