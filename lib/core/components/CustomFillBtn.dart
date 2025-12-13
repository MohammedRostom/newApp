import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFillBtn extends StatelessWidget {
  const CustomFillBtn({
    super.key,
    this.onTap,
    this.btnText,
    required this.isloding,
  });

  @override
  final void Function()? onTap;
  final String? btnText;
  final bool isloding;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(30.r),
          ),

          height: 48.0.h,
          child: Center(
            child: isloding
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
                    btnText ?? "Btn",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
