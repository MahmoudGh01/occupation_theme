
import 'package:flutter/material.dart';

import 'globalColors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final Color? iconColor;
  final double? width;
  final Color borderColor;
  final double borderRadius;
  final Color focusedBorderColor; // New property for focused border color
  final double focusedBorderWidth; // New property for focused border width
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.iconColor,
    this.width,
    this.borderColor = Colors.grey,
    this.borderRadius = 8.0,
    this.focusedBorderColor =
        GlobalColors.secondaryColor, // Initialize focused border color
    this.focusedBorderWidth = 2.0, // Initialize focused border width
    this.keyboardType,
    this.textInputAction,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            // Customize the focused border
            borderSide: BorderSide(
                color: focusedBorderColor, width: focusedBorderWidth),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          prefixIcon:
          prefixIcon != null ? Icon(prefixIcon, color: iconColor) : null,
          suffixIcon: suffixIcon,
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validator,
      ),
    );
  }
}