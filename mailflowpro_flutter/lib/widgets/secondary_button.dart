// widgets/secondary_button.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isExpanded;

  const SecondaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.icon,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget button = OutlinedButton(
      onPressed: onPressed,
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon!,
                const SizedBox(width: 8),
                Text(text),
              ],
            )
          : Text(text),
    );

    return isExpanded ? SizedBox(width: double.infinity, child: button) : button;
  }
}
