import 'package:flutter/material.dart';
import 'package:eva_app/tips/kitchen_tips_screen.dart';
import 'package:eva_app/tips/overload_tips_screen.dart';
import 'package:eva_app/tips/child_safety_tips_screen.dart';
import 'package:eva_app/tips/basic_maintenance_tips_screen.dart';
import 'package:eva_app/tips/electrical_installations_tips_screen.dart';
import 'package:eva_app/tips/fire_prevention_tips_screen.dart';
import 'package:eva_app/widgets/eva_app_bar.dart';

class PreventionTipsScreen extends StatefulWidget {
  const PreventionTipsScreen({super.key});

  @override
  _PreventionTipsScreenState createState() => _PreventionTipsScreenState();
}

class _PreventionTipsScreenState extends State<PreventionTipsScreen> {
  // Lista de todas las categorías de consejos
  final List<Map<String, dynamic>> _allCategories = [
    {
      'title': 'Seguridad en la Cocina',
      'subtitle': 'Te ayudaré a conocer las mejores prácticas de seguridad',
      'icon': Icons.kitchen_rounded,
      'color': Colors.red.shade400,
      'id': 'kitchen',
    },
    {
      'title': 'Sobrecargas y Extensiones',
      'subtitle': 'Te ayudaré a conocer las mejores prácticas de seguridad',
      'icon': Icons.power_rounded,
      'color': Colors.yellow.shade800,
      'id': 'overload',
    },
    {
      'title': 'Protección para Niños',
      'subtitle': 'Te ayudaré a conocer las mejores prácticas de seguridad',
      'icon': Icons.child_friendly_rounded,
      'color': Colors.blue.shade400,
      'id': 'children',
    },
    {
      'title': 'Mantenimiento Básico',
      'subtitle': 'Te ayudaré a conocer las mejores prácticas de seguridad',
      'icon': Icons.build_rounded,
      'color': Colors.green.shade400,
      'id': 'maintenance',
    },
    {
      'title': 'Instalaciones Eléctricas',
      'subtitle': 'Te ayudaré a conocer las mejores prácticas de seguridad',
      'icon': Icons.electrical_services_rounded,
      'color': Colors.orange.shade400,
      'id': 'installations',
    },
    {
      'title': 'Prevención de Incendios',
      'subtitle': 'Te ayudaré a conocer las mejores prácticas de seguridad',
      'icon': Icons.fire_extinguisher_rounded,
      'color': Colors.red.shade700,
      'id': 'fires',
    },
  ];

  // Lista que contendrá las categorías filtradas
  List<Map<String, dynamic>> _filteredCategories = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Al inicio, la lista filtrada contiene todas las categorías
    _filteredCategories = _allCategories;
    // Escucha los cambios en el campo de búsqueda
    _searchController.addListener(_filterCategories);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCategories);
    _searchController.dispose();
    super.dispose();
  }

  // Función para filtrar las categorías
  void _filterCategories() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCategories = _allCategories.where((category) {
        final title = category['title'].toString().toLowerCase();
        return title.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EvaAppBar(
        title: 'Consejos de Eva',
        subtitle: 'Aprende a mantener tu hogar seguro',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredCategories.length,
                itemBuilder: (context, index) {
                  final category = _filteredCategories[index];
                  return _buildCategoryCard(
                    context: context,
                    title: category['title'],
                    subtitle: category['subtitle'],
                    icon: category['icon'],
                    color: category['color'],
                    onTap: () => _navigateTo(context, category['id']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS REUTILIZABLES ---

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Buscar consejos de seguridad...',
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border(left: BorderSide(color: color, width: 5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 28),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey.shade400,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, String id) {
    switch (id) {
      case 'kitchen':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const KitchenTipsScreen()),
        );
        break;
      case 'overload':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const OverloadTipsScreen()),
        );
        break;
      case 'children':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ChildSafetyTipsScreen()),
        );
        break;
      case 'maintenance':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const BasicMaintenanceTipsScreen()),
        );
        break;
      case 'installations':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ElectricalInstallationsTipsScreen(),
          ),
        );
        break;
      case 'fires':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const FirePreventionTipsScreen()),
        );
        break;
    }
  }
}
