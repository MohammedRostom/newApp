import 'package:auth_feature_1_0/core/utils/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final int maxLines;

  /// ✅ دعم Regex Validation
  final String? regexPattern;
  final String? regexError;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.maxLines = 1,
    this.regexPattern,
    this.regexError,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // العرض كله تلقائي
      child: TextFormField(
        autocorrect: true,

        cursorColor: AppColor.primarycolor,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLines: maxLines,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (value) {
          // ✅ تحقق من الفاضي الأول
          if (value == null || value.isEmpty) {
            return "This field is required";
          }

          // ✅ تحقق بالـ Regex لو موجود
          if (regexPattern != null && !RegExp(regexPattern!).hasMatch(value)) {
            return regexError ?? "Invalid format";
          }

          // ✅ استدعاء الـ Validator المخصص (لو في)
          if (validator != null) {
            return validator!(value);
          }

          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 203, 203, 203),
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: AppColor.primarycolor),
          ),
        ),
      ),
    );
  }
}
