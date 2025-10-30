import 'package:flutter/material.dart';
import 'package:eva_app/home_screen.dart';
import 'package:eva_app/settings_screen.dart';
import 'package:eva_app/prevention_tips_screen.dart';

class AppRouter {
  static const String homeRoute = '/';
  static const String settingsRoute = '/settings';
  static const String preventionTipsRoute = '/prevention-tips';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case preventionTipsRoute:
        return MaterialPageRoute(builder: (_) => const PreventionTipsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No hay ruta definida para ${settings.name}'),
            ),
          ),
        );
    }
  }
}
