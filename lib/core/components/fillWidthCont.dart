import 'package:flutter/material.dart';

class FullWidthContainer extends StatelessWidget {
  final double? height;
  final Color? color;
  final Widget child;

  const FullWidthContainer({
    super.key,
    this.height,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ياخد العرض كله تلقائي
      height: height,
      color: color,
      child: child,
    );
  }
}
