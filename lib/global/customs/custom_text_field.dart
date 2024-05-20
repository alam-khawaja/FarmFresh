import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants/color_constants.dart';
import '../utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final Widget? prefix;
  final Widget? suffix;
  final String placeHolder;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final double? prefixWidth;
  final int? maxLines;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;

  const CustomTextField(
      {this.prefix,
      this.suffix,
      required this.placeHolder,
      required this.controller,
      this.validator,
      this.keyboardType,
      this.obscureText,
      this.onChanged,
      this.prefixWidth,
      this.inputFormatters,
      this.maxLines = 1,
      this.enabled = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      //decoration: BoxDecoration(
      //borderRadius: BorderRadius.circular(12),
      //border: Border.all(color: Colors.grey[300]!, width: 2),
      //  ),
      child: TextFormField(
          maxLines: maxLines,
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          enabled: enabled,
          decoration: inputDecoration(),
          onChanged: onChanged,
          inputFormatters: inputFormatters),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
        hintText: placeHolder,
        suffixIcon: suffix,
        hintStyle: AppTextStyles.hintTextStyle,
        prefixIconConstraints: BoxConstraints.expand(
            width: prefix == null ? 15 : prefixWidth ?? Get.width * 0.15,
            height: prefixWidth != null ? 20 : 17),
        prefixIcon: SizedBox(child: prefix),
        contentPadding: EdgeInsets.symmetric(
            vertical: maxLines! > 5 ? 10 : 0, horizontal: 0),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: kSecondaryColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: kSecondaryColor)));
  }
}
