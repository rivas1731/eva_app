import 'package:flutter/material.dart';
import 'package:eva_app/app_router.dart';
import 'package:eva_app/widgets/eva_app_bar.dart';

class FirstAidSituationsScreen extends StatefulWidget {
  const FirstAidSituationsScreen({super.key});

  @override
  State<FirstAidSituationsScreen> createState() =>
      _FirstAidSituationsScreenState();
}

class _FirstAidSituationsScreenState extends State<FirstAidSituationsScreen> {
  final List<Map<String, dynamic>> _allSituations = [
    {
      'title': 'Contacto con cables expuestos o dañados',
      'subtitle': 'Causa y riesgo de electrocución directa',
      'icon': Icons.bolt_rounded,
      'color': Colors.red.shade600,
      'route': AppRouter.firstAidExposedCablesRoute,
    },
    {
      'title': 'Manipulación de tomas (enchufes)',
      'subtitle': 'Reparaciones sin cortar luz u objetos metálicos',
      'icon': Icons.power_rounded,
      'color': Colors.orange.shade700,
      'route': AppRouter.firstAidOutletsRoute,
    },
    {
      'title': 'Agua + electricidad',
      'subtitle': 'Escena mojada, suelo húmedo o cerca de ducha',
      'icon': Icons.water_drop_rounded,
      'color': Colors.blue.shade500,
      'route': AppRouter.firstAidWaterRoute,
    },
    {
      'title': 'Sobrecarga de extensiones y regletas',
      'subtitle': 'Calentamiento, derretimiento y posibles incendios',
      'icon': Icons.electrical_services_rounded,
      'color': Colors.amber.shade800,
      'route': AppRouter.firstAidOverloadRoute,
    },
    {
      'title': 'Aparatos defectuosos o antiguos',
      'subtitle': 'Carcasa energizada por fallos internos',
      'icon': Icons.kitchen_rounded,
      'color': Colors.green.shade600,
      'route': AppRouter.firstAidFaultyApplianceRoute,
    },
  ];

  List<Map<String, dynamic>> _filtered = [];
  final _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filtered = _allSituations;
    _search.addListener(_onSearch);
  }

  @override
  void dispose() {
    _search.removeListener(_onSearch);
    _search.dispose();
    super.dispose();
  }

  void _onSearch() {
    final q = _search.text.toLowerCase();
    setState(() {
      _filtered = _allSituations
          .where((s) => s['title'].toString().toLowerCase().contains(q))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EvaAppBar(
        title: 'Primeros Auxilios',
        subtitle: 'Qué hacer en cada situación',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearch(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filtered.length,
                itemBuilder: (context, i) {
                  final s = _filtered[i];
                  return _buildCard(
                    context: context,
                    title: s['title'],
                    subtitle: s['subtitle'],
                    icon: s['icon'],
                    color: s['color'],
                    onTap: () => Navigator.pushNamed(context, s['route']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _search,
        decoration: InputDecoration(
          hintText: 'Buscar situación...',
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
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
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
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
}
