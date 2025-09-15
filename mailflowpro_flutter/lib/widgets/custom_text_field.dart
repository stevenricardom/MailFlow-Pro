

// widgets/custom_text_field.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final int maxLines;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.hintText,
    this.maxLines = 1,
    this.validator,
    this.keyboardType,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.label,
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textLight,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          maxLines: maxLines,
          validator: validator,
          keyboardType: keyboardType,
          enabled: enabled,
        ),
      ],
    );
  }
}