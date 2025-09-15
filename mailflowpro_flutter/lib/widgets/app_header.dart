
// widgets/app_header.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppHeader extends StatelessWidget {
  final bool darkMode;
  final VoidCallback onThemeToggle;
  final VoidCallback onLanguageToggle;
  final String language;
  final String userEmail;

  const AppHeader({
    Key? key,
    required this.darkMode,
    required this.onThemeToggle,
    required this.onLanguageToggle,
    required this.language,
    required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MailFlow Pro',
                  style: AppTextStyles.h1.copyWith(color: AppColors.primary),
                ),
                Text(
                  'Automatización de correos electrónicos',
                  style: AppTextStyles.subtitle,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onLanguageToggle,
                  icon: const Icon(Icons.language),
                  tooltip: 'Cambiar idioma',
                ),
                IconButton(
                  onPressed: onThemeToggle,
                  icon: Icon(darkMode ? Icons.light_mode : Icons.dark_mode),
                  tooltip: 'Modo oscuro/claro',
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.person,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        userEmail,
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
