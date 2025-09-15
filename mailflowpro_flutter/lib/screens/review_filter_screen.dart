
// screens/review_filter_screen.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/filter_model.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';
import '../widgets/status_chip.dart';

class ReviewFilterScreen extends StatelessWidget {
  final Filter filter;
  final Function(Filter) onConfirm;
  final bool isEditing;

  const ReviewFilterScreen({
    Key? key,
    required this.filter,
    required this.onConfirm,
    required this.isEditing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Revisar Cambios' : 'Revisar Nuevo Filtro',
          style: AppTextStyles.h2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Resumen del filtro', style: AppTextStyles.h3),
                      const SizedBox(height: 16),
                      _buildSummaryItem('Nombre', filter.name),
                      _buildSummaryItem('Descripción', filter.description),
                      _buildSummaryItem('Tipo', _getFilterTypeText(filter.type)),
                      _buildSummaryItem('Criterios', filter.criteria, isHighlighted: true),
                      if (filter.type != 'email')
                        _buildSummaryItem(
                          'Sensible a mayúsculas',
                          filter.caseSensitive ? 'Sí' : 'No',
                        ),
                      _buildSummaryRow('Estado', StatusChip(
                        label: filter.active ? 'Activo' : 'Inactivo',
                        isActive: filter.active,
                      )),
                      _buildSummaryRow('Respuesta automática', StatusChip(
                        label: filter.autoReply ? 'Activada' : 'Desactivada',
                        color: filter.autoReply ? AppColors.success : AppColors.textLight,
                      )),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, {bool isHighlighted = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: AppTextStyles.label,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: isHighlighted
                  ? AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    )
                  : AppTextStyles.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, Widget value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: AppTextStyles.label,
            ),
          ),
          value,
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryButton(
            text: isEditing ? 'Guardar cambios' : 'Crear filtro',
            isExpanded: true,
            onPressed: () => onConfirm(filter),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: SecondaryButton(
            text: 'Volver a editar',
            isExpanded: true,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }

  String _getFilterTypeText(String type) {
    switch (type) {
      case 'email':
        return 'Dirección de correo';
      case 'keyword':
        return 'Palabra clave';
      case 'subject':
        return 'Asunto/Cuerpo';
      default:
        return 'Desconocido';
    }
  }
}
