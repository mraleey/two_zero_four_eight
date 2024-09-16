import 'package:flutter/material.dart';

import '../constants/fonts.dart';
import 'app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final bool obscureText;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? borderColor;
  final Color? labelColor;

  const CustomTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.obscureText = false,
    this.focusNode,
    this.readOnly,
    this.keyboardType,
    this.prefixIconColor,
    this.suffixIconColor,
    this.borderColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      style: TextStyle(
        fontSize: CustomFontSize.extraLarge(context),
        color: kDarkColor,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: CustomFontSize.large(context),
          color: labelColor ?? kCardBgColor,
        ),
        prefixIcon: Icon(prefixIcon, color: prefixIconColor ?? kPrimaryColor),
        suffixIcon: suffixIcon,
        suffixStyle: TextStyle(color: suffixIconColor ?? kPrimaryColor),
        suffixIconColor: suffixIconColor ?? kPrimaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: kLightColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: kDarkColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: borderColor ?? kLightColor),
        ),
      ),
    );
  }
}
