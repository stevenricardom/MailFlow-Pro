
// widgets/status_chip.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class StatusChip extends StatelessWidget {
  final String label;
  final bool? isActive;
  final Color? color;

  const StatusChip({
    Key? key,
    required this.label,
    this.isActive,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color chipColor;
    Color textColor;

    if (color != null) {
      chipColor = color!.withOpacity(0.1);
      textColor = color!;
    } else if (isActive != null) {
      chipColor = isActive! ? AppColors.success.withOpacity(0.1) : AppColors.error.withOpacity(0.1);
      textColor = isActive! ? AppColors.success : AppColors.error;
    } else {
      chipColor = AppColors.primary.withOpacity(0.1);
      textColor = AppColors.primary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}