import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:portfolio_builder/app/core/style/app_color.dart';
import 'package:portfolio_builder/app/core/style/app_style.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;
  final double fontSize;

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    this.width,
    this.height,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: normalTextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final RxString validationText;

  const PhoneNumberField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.validationText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.dividerColor),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.textColor),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.dividerColor),
          borderRadius: BorderRadius.circular(4.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(width: 1.5, color: AppColors.darkRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: AppColors.darkRed),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabled: true,
        filled: true,
        hintText: "01XXX XXXXXX",
        hintStyle: normalTextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.textHintColor,
        ),
        fillColor: AppColors.whiteLiteColor,
        errorStyle: const TextStyle(height: 0, fontSize: 0),
      ),
      onTapOutside: (_) => Get.focusScope?.unfocus(),
      onChanged: (value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (value.isEmpty) {
            validationText.value = "Phone number is required";
          } else if (!RegExp(r'^(01[3-9])[0-9]{8}$').hasMatch(value)) {
            validationText.value = "Enter a valid phone number";
          } else {
            validationText.value = "";
          }
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) return ' ';
        if (!RegExp(r'^(01[3-9])[0-9]{8}$').hasMatch(value)) return ' ';
        return null;
      },
    );
  }
}

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final int? maxLength;

  const CommonTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.onTap,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      maxLength: maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10, right: 10),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.dividerColor),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.textColor),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.dividerColor),
          borderRadius: BorderRadius.circular(4.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(width: 1.5, color: AppColors.darkRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: AppColors.darkRed),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabled: true,
        filled: true,
        hintText: hintText,
        hintStyle: normalTextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.textHintColor,
        ),
        fillColor: AppColors.whiteLiteColor,
        errorStyle: normalTextStyle(height: 0, fontSize: 0),
        counterText: "",
      ),
      onTap: onTap,
      onTapOutside: (_) => Get.focusScope?.unfocus(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
