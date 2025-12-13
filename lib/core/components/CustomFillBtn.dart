import 'package:auth_feature_1_0/core/utils/app_Color.dart';
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
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
          decoration: BoxDecoration(
            color: AppColor.primarycolor,
            borderRadius: BorderRadius.circular(30.r),
          ),

          height: 44.0.h,
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
