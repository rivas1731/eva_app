import 'package:flutter/material.dart';
import 'package:eva_app/app_router.dart'; // Importa el enrutador

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'Eva App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.yellow,
            scaffoldBackgroundColor: Colors.grey.shade100,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.yellow.shade700,
              foregroundColor: Colors.black87,
            ),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: currentMode,
          // Usa el enrutador para la navegación
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRouter.homeRoute,
        );
      },
    );
  }
}
