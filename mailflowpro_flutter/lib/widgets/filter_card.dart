

// widgets/filter_card.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/filter_model.dart';
import 'status_chip.dart';

class FilterCard extends StatelessWidget {
  final Filter filter;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const FilterCard({
    Key? key,
    required this.filter,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            filter.name,
                            style: AppTextStyles.h3,
                          ),
                          const SizedBox(width: 12),
                          StatusChip(
                            label: filter.active ? 'Activo' : 'Inactivo',
                            isActive: filter.active,
                          ),
                          if (filter.autoReply) ...[
                            const SizedBox(width: 8),
                            const StatusChip(
                              label: 'Respuesta automática',
                              color: AppColors.info,
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        filter.description,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            _getFilterIcon(filter.type),
                            size: 16,
                            color: AppColors.textLight,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _getFilterTypeText(filter.type),
                            style: AppTextStyles.bodySmall,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            filter.criteria,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit),
                      tooltip: 'Editar filtro',
                      color: AppColors.primary,
                    ),
                    IconButton(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete),
                      tooltip: 'Eliminar filtro',
                      color: AppColors.error,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getFilterIcon(String type) {
    switch (type) {
      case 'email':
        return Icons.email;
      case 'keyword':
        return Icons.label;
      case 'subject':
        return Icons.description;
      default:
        return Icons.filter_alt;
    }
  }

  String _getFilterTypeText(String type) {
    switch (type) {
      case 'email':
        return 'Dirección';
      case 'keyword':
        return 'Palabra clave';
      case 'subject':
        return 'Asunto';
      default:
        return 'Filtro';
    }
  }
}