import 'package:flutter/material.dart';
import 'package:eva_app/home_screen.dart';
import 'package:eva_app/settings_screen.dart';
import 'package:eva_app/prevention_tips_screen.dart';
import 'package:eva_app/profile_screen.dart';
import 'package:eva_app/tips/first_aid/first_aid_situations_screen.dart';
import 'package:eva_app/tips/first_aid/exposed_cables_first_aid_screen.dart';
import 'package:eva_app/tips/first_aid/outlet_misuse_first_aid_screen.dart';
import 'package:eva_app/tips/first_aid/water_electricity_first_aid_screen.dart';
import 'package:eva_app/tips/first_aid/power_strip_overload_first_aid_screen.dart';
import 'package:eva_app/tips/first_aid/faulty_appliance_first_aid_screen.dart';

class AppRouter {
  static const String homeRoute = '/';
  static const String settingsRoute = '/settings';
  static const String preventionTipsRoute = '/prevention-tips';
  static const String profileRoute = '/profile';
  static const String firstAidRoute = '/first-aid';
  static const String firstAidExposedCablesRoute = '/first-aid/exposed-cables';
  static const String firstAidOutletsRoute = '/first-aid/outlets';
  static const String firstAidWaterRoute = '/first-aid/water';
  static const String firstAidOverloadRoute = '/first-aid/overload';
  static const String firstAidFaultyApplianceRoute =
      '/first-aid/faulty-appliance';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case preventionTipsRoute:
        return MaterialPageRoute(builder: (_) => const PreventionTipsScreen());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case firstAidRoute:
        return MaterialPageRoute(
          builder: (_) => const FirstAidSituationsScreen(),
        );
      case firstAidExposedCablesRoute:
        return MaterialPageRoute(
          builder: (_) => const ExposedCablesFirstAidScreen(),
        );
      case firstAidOutletsRoute:
        return MaterialPageRoute(
          builder: (_) => const OutletMisuseFirstAidScreen(),
        );
      case firstAidWaterRoute:
        return MaterialPageRoute(
          builder: (_) => const WaterElectricityFirstAidScreen(),
        );
      case firstAidOverloadRoute:
        return MaterialPageRoute(
          builder: (_) => const PowerStripOverloadFirstAidScreen(),
        );
      case firstAidFaultyApplianceRoute:
        return MaterialPageRoute(
          builder: (_) => const FaultyApplianceFirstAidScreen(),
        );
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
