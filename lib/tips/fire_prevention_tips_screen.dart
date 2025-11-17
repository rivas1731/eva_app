import 'package:flutter/material.dart';
import 'package:eva_app/tips/widgets/tip_detail_scaffold.dart';

class FirePreventionTipsScreen extends StatelessWidget {
  const FirePreventionTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TipDetailScaffold(
      title: 'Prevención de Incendios',
      color: Colors.red.shade700,
      heroIcon: Icons.fire_extinguisher_rounded,
      items: const [
        TipItem(
          icon: Icons.smoke_free_outlined,
          title: 'Detectores de humo',
          description:
              'Instálalos en pasillos y dormitorios. Prueba mensualmente y cambia baterías según recomendación del fabricante.',
        ),
        TipItem(
          icon: Icons.no_meals_outlined,
          title: 'Cocina siempre vigilada',
          description:
              'Nunca dejes aceite al fuego sin supervisión. Mantén una tapa a mano para sofocar llamas en sartén (no uses agua).',
        ),
        TipItem(
          icon: Icons.power_off_outlined,
          title: 'Corta fuentes de calor',
          description:
              'Apaga y desconecta estufas, planchas y calefactores al dormir o salir. Mantén textiles lejos de fuentes de calor.',
        ),
      ],
    );
  }
}
