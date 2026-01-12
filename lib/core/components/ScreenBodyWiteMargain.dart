import 'package:auth_feature_1_0/core/Constant.dart';
import 'package:flutter/material.dart';

class ScreenBodyWiteMargain extends StatelessWidget {
  const ScreenBodyWiteMargain({super.key, required this.widget});

  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Constant.mragin_screen_H),
        child: widget,
      ),
    );
  }
}
