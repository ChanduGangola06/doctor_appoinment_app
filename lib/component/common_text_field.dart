import 'package:doctor_appoinment_app/constants/my_colors.dart';
import 'package:flutter/material.dart';

import '../constants/text_style_const.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final int? maxLine;
  final int? minLine;
  final TextInputType? keyBoardType;
  final bool readOnly;
  final bool? obscureText;

  const CommonTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.onTap,
    required this.validator,
    required this.controller,
    this.maxLine,
    this.minLine,
    this.keyBoardType,
    this.readOnly = false,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TextFormField(
      style: TextStyleConst.mediumTextStyle(
        MyColors.blackColor,
        width * 0.04,
      ),
      obscureText: obscureText ?? false,
      readOnly: readOnly,
      keyboardType: keyBoardType,
      maxLines: maxLine,
      minLines: minLine,
      onTap: onTap,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: MyColors.borderGreyColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide:
              const BorderSide(color: MyColors.borderGreyColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: MyColors.borderGreyColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: MyColors.borderGreyColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: MyColors.borderGreyColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: MyColors.borderGreyColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        hintStyle: TextStyleConst.hintTextStyle(MyColors.hintGreyColor),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
