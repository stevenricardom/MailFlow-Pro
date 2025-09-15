
// screens/create_filter_screen.dart
import 'package:flutter/material.dart';
import 'package:mailflowpro_flutter/screens/review_filter_screen.dart';
import '../theme/app_theme.dart';
import '../models/filter_model.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';

class CreateFilterScreen extends StatefulWidget {
  final Function(Filter) onFilterCreated;

  const CreateFilterScreen({
    Key? key,
    required this.onFilterCreated,
  }) : super(key: key);

  @override
  State<CreateFilterScreen> createState() => _CreateFilterScreenState();
}

class _CreateFilterScreenState extends State<CreateFilterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _criteriaController = TextEditingController();
  
  String _filterType = 'email';
  bool _autoReply = false;
  bool _active = true;
  bool _caseSensitive = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _criteriaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Nuevo Filtro', style: AppTextStyles.h2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: _nameController,
                            label: 'Nombre del filtro',
                            hintText: 'Ej: Correos de trabajo',
                            validator: (value) => value?.isEmpty == true ? 'Campo requerido' : null,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _descriptionController,
                            label: 'Descripción',
                            hintText: 'Describe qué hace este filtro...',
                            maxLines: 3,
                          ),
                          const SizedBox(height: 16),
                          _buildFilterTypeSelection(),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _criteriaController,
                            label: _getCriteriaLabel(),
                            hintText: _getCriteriaHint(),
                            validator: (value) => value?.isEmpty == true ? 'Campo requerido' : null,
                          ),
                          const SizedBox(height: 16),
                          _buildConfigurationOptions(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildActionButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTypeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tipo de filtrado', style: AppTextStyles.label),
        const SizedBox(height: 8),
        Card(
          color: AppColors.primaryLight.withOpacity(0.3),
          child: Column(
            children: [
              _buildRadioOption(
                'email',
                'Filtrar por dirección de correo electrónico específica',
                Icons.email,
                'Filtra correos de remitentes específicos',
              ),
              _buildRadioOption(
                'keyword',
                'Filtrar por palabra clave',
                Icons.label,
                'Busca palabras en el contenido del correo',
              ),
              _buildRadioOption(
                'subject',
                'Filtrar por asunto/cuerpo',
                Icons.description,
                'Busca texto en el asunto o cuerpo del correo',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRadioOption(String value, String title, IconData icon, String subtitle) {
    return RadioListTile<String>(
      title: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyMedium),
                Text(subtitle, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
        ],
      ),
      value: value,
      groupValue: _filterType,
      onChanged: (newValue) => setState(() => _filterType = newValue!),
      activeColor: AppColors.primary,
    );
  }

  Widget _buildConfigurationOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Configuración adicional', style: AppTextStyles.label),
        const SizedBox(height: 8),
        Card(
          color: AppColors.surface,
          child: Column(
            children: [
              if (_filterType != 'email')
                CheckboxListTile(
                  title: Text('Sensible a mayúsculas y minúsculas', style: AppTextStyles.bodyMedium),
                  subtitle: Text('Distinguir entre mayúsculas y minúsculas', style: AppTextStyles.bodySmall),
                  value: _caseSensitive,
                  onChanged: (value) => setState(() => _caseSensitive = value!),
                  activeColor: AppColors.primary,
                ),
              CheckboxListTile(
                title: Text('Activar respuesta automática', style: AppTextStyles.bodyMedium),
                subtitle: Text('Enviar respuesta automática a estos correos', style: AppTextStyles.bodySmall),
                value: _autoReply,
                onChanged: (value) => setState(() => _autoReply = value!),
                activeColor: AppColors.primary,
              ),
              CheckboxListTile(
                title: Text('Filtro activo', style: AppTextStyles.bodyMedium),
                subtitle: Text('El filtro se aplicará automáticamente', style: AppTextStyles.bodySmall),
                value: _active,
                onChanged: (value) => setState(() => _active = value!),
                activeColor: AppColors.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: PrimaryButton(
            text: 'Revisar filtro',
            isExpanded: true,
            onPressed: _validateAndProceed,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: SecondaryButton(
            text: 'Cancelar',
            isExpanded: true,
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }

  String _getCriteriaLabel() {
    switch (_filterType) {
      case 'email':
        return 'Dirección de correo electrónico';
      case 'keyword':
        return 'Palabras clave (separadas por comas)';
      case 'subject':
        return 'Texto en asunto/cuerpo';
      default:
        return 'Criterios';
    }
  }

  String _getCriteriaHint() {
    switch (_filterType) {
      case 'email':
        return 'ejemplo@dominio.com';
      case 'keyword':
        return 'promoción, oferta, descuento';
      case 'subject':
        return 'Texto a buscar...';
      default:
        return '';
    }
  }

  void _validateAndProceed() {
    if (_formKey.currentState!.validate()) {
      final filter = Filter(
        id: DateTime.now().millisecondsSinceEpoch,
        name: _nameController.text,
        description: _descriptionController.text,
        type: _filterType,
        criteria: _criteriaController.text,
        active: _active,
        autoReply: _autoReply,
        caseSensitive: _caseSensitive,
      );

      // Mostrar pantalla de revisión
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewFilterScreen(
            filter: filter,
            onConfirm: (confirmedFilter) {
              widget.onFilterCreated(confirmedFilter);
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            isEditing: false,
          ),
        ),
      );
    }
  }
}
