import 'package:flutter/material.dart';
import 'package:eva_app/main.dart'; // Importa main.dart para acceder al notificador

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    // Determina si el modo oscuro está activado a partir del notificador global
    final isDarkMode = MyApp.themeNotifier.value == ThemeMode.dark;

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
              title: Text(
                'Modo Oscuro',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Habilita para un tema oscuro en la aplicación',
              ),
              value: isDarkMode, // El valor se basa en el estado del tema global
              onChanged: (bool value) {
                // Actualiza el notificador global y reconstruye la interfaz
                setState(() {
                  MyApp.themeNotifier.value =
                      value ? ThemeMode.dark : ThemeMode.light;
                });
              },
              activeColor: Colors.yellow.shade700,
              secondary: Icon(
                Icons.dark_mode_outlined,
                color: isDarkMode ? Colors.yellow.shade700 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
