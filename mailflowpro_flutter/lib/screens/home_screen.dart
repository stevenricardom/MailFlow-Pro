
// screens/home_screen.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/filter_model.dart';
import '../widgets/app_header.dart';
import '../widgets/filter_card.dart';
import '../widgets/primary_button.dart';
import 'create_filter_screen.dart';
import 'edit_filter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _darkMode = false;
  String _language = 'es';
  final List<Filter> _filters = [
    Filter(
      id: 1,
      name: 'Promociones',
      description: 'Filtrar correos promocionales y ofertas',
      type: 'keyword',
      criteria: 'promoción, oferta, descuento',
      active: true,
      autoReply: false,
    ),
    Filter(
      id: 2,
      name: 'Trabajo importante',
      description: 'Correos de jefe y gerencia',
      type: 'email',
      criteria: 'jefe@empresa.com, gerencia@empresa.com',
      active: true,
      autoReply: true,
    ),
    Filter(
      id: 3,
      name: 'Newsletter',
      description: 'Boletines informativos',
      type: 'subject',
      criteria: 'newsletter, boletín',
      active: false,
      autoReply: false,
    ),
  ];

  void _toggleTheme() {
    setState(() {
      _darkMode = !_darkMode;
    });
  }

  void _toggleLanguage() {
    setState(() {
      _language = _language == 'es' ? 'en' : 'es';
    });
  }

  void _deleteFilter(int id) {
    setState(() {
      _filters.removeWhere((filter) => filter.id == id);
    });
  }

  void _addFilter(Filter filter) {
    setState(() {
      _filters.add(filter);
    });
  }

  void _updateFilter(Filter updatedFilter) {
    setState(() {
      int index = _filters.indexWhere((filter) => filter.id == updatedFilter.id);
      if (index != -1) {
        _filters[index] = updatedFilter;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _darkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      child: Scaffold(
        body: Column(
          children: [
            AppHeader(
              darkMode: _darkMode,
              onThemeToggle: _toggleTheme,
              onLanguageToggle: _toggleLanguage,
              language: _language,
              userEmail: 'usuario@gmail.com',
            ),
            Expanded(
              child: _buildFilterList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterList() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filtros Activos',
                style: AppTextStyles.h2,
              ),
              PrimaryButton(
                text: 'Añadir Filtro',
                icon: const Icon(Icons.add, size: 20),
                onPressed: () => _navigateToCreateFilter(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _filters.isEmpty ? _buildEmptyState() : _buildFilterCards(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.mail,
                size: 48,
                color: AppColors.textLight,
              ),
              const SizedBox(height: 16),
              Text(
                'No hay filtros configurados',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: 'Crear primer filtro',
                onPressed: () => _navigateToCreateFilter(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterCards() {
    return ListView.builder(
      itemCount: _filters.length,
      itemBuilder: (context, index) {
        final filter = _filters[index];
        return FilterCard(
          filter: filter,
          onEdit: () => _navigateToEditFilter(filter),
          onDelete: () => _showDeleteDialog(filter),
        );
      },
    );
  }

  void _navigateToCreateFilter() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateFilterScreen(
          onFilterCreated: _addFilter,
        ),
      ),
    );
  }

  void _navigateToEditFilter(Filter filter) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditFilterScreen(
          filter: filter,
          onFilterUpdated: _updateFilter,
        ),
      ),
    );
  }

  void _showDeleteDialog(Filter filter) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar eliminación', style: AppTextStyles.h3),
          content: Text(
            '¿Estás seguro de que deseas eliminar el filtro "${filter.name}"? Esta acción no se puede deshacer.',
            style: AppTextStyles.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            PrimaryButton(
              text: 'Eliminar',
              backgroundColor: AppColors.error,
              onPressed: () {
                Navigator.of(context).pop();
                _deleteFilter(filter.id);
              },
            ),
          ],
        );
      },
    );
  }
}
