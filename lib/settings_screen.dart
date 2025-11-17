import 'package:flutter/material.dart';
import 'package:eva_app/main.dart'; // Importa main.dart para acceder al notificador

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double? _pendingScale;
  @override
  Widget build(BuildContext context) {
    // Determina si el modo oscuro está activado a partir del notificador global
    final isDarkMode = MyApp.themeNotifier.value == ThemeMode.dark;
    final currentScale = _pendingScale ?? MyApp.textScaleNotifier.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: Colors.yellow.shade700,
        foregroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Modo Oscuro', style: TextStyle(fontSize: 18)),
              subtitle: Text('Habilita para un tema oscuro en la aplicación'),
              value:
                  isDarkMode, // El valor se basa en el estado del tema global
              onChanged: (bool value) {
                // Actualiza el notificador global y reconstruye la interfaz
                setState(() {
                  MyApp.themeNotifier.value = value
                      ? ThemeMode.dark
                      : ThemeMode.light;
                });
              },
              activeThumbColor: Colors.yellow.shade700,
              secondary: Icon(
                Icons.dark_mode_outlined,
                color: isDarkMode ? Colors.yellow.shade700 : Colors.black54,
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Tamaño de interfaz',
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pequeño',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      Text(
                        '${(currentScale * 100).round()}%',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Grande',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  Slider(
                    value: currentScale.clamp(0.8, 1.4),
                    min: 0.8,
                    max: 1.4,
                    divisions: 6,
                    label: '${(currentScale * 100).round()}%',
                    onChanged: (v) {
                      setState(() {
                        _pendingScale = v;
                        MyApp.textScaleNotifier.value = v;
                      });
                    },
                    activeColor: Colors.yellow.shade700,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Ajusta el tamaño de textos y controles en toda la app.',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
