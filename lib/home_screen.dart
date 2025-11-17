import 'package:flutter/material.dart';
import 'package:eva_app/app_router.dart'; // Importa el enrutador

// Este es el widget de tu pantalla principal
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar personalizada para "Eva"
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade700,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          children: [
            Icon(Icons.bolt, color: Colors.black87, size: 50),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Eva',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Tu asistente de seguridad eléctrica',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        actions: [
          // Botón de menú para abrir el endDrawer
          Builder(
            builder: (ctx) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black87),
              tooltip: 'Menú',
              onPressed: () => Scaffold.of(ctx).openEndDrawer(),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      // 2. Cuerpo de la pantalla
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 3. Botón de Emergencia
              _buildEmergencyButton(context),
              SizedBox(height: 16),

              // 4. Botón de Consejos de Prevención
              _buildPreventionButton(context),
              SizedBox(height: 24),

              // 5. Título de la sección
              Text(
                'Consejos del día',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),

              // 6. Lista de Consejos del Día
              _buildDailyTipCard(
                tip:
                    'No uses enchufes que estén rotos o que produzcan chispas.',
              ),
              _buildDailyTipCard(
                tip:
                    'Desenchufa los aparatos eléctricos que no estés usando para ahorrar energía.',
              ),
              _buildDailyTipCard(
                tip:
                    'Mantén los cables eléctricos lejos del agua y de fuentes de calor.',
              ),
            ],
          ),
        ),
      ),

      // Sidebar derecho con opciones
      endDrawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.yellow.shade700),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Menú',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Perfil'),
                onTap: () {
                  Navigator.of(context).pop(); // cerrar drawer
                  Navigator.pushNamed(context, AppRouter.profileRoute);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Ajustes'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, AppRouter.settingsRoute);
                },
              ),
            ],
          ),
        ),
      ),

      // Se eliminó el botón flotante de Ajustes; ahora está en el menú lateral
    );
  }

  // --- WIDGETS REUTILIZABLES ---

  Widget _buildEmergencyButton(BuildContext context) {
    return Card(
      color: Colors.red.shade700,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRouter.firstAidRoute);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.white, size: 30),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Primeros Auxilios',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Toca para ver los pasos',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreventionButton(BuildContext context) {
    return Card(
      color: Colors.yellow.shade700,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Navega usando la ruta nombrada
          Navigator.pushNamed(context, AppRouter.preventionTipsRoute);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bolt, color: Colors.black87),
              SizedBox(width: 12),
              Text(
                'Consejos de Prevención',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDailyTipCard({required String tip}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.lightbulb_outline,
              color: Colors.yellow.shade800,
              size: 28,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                tip,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
