import 'package:flutter/material.dart';
import 'package:eva_app/tips/widgets/tip_detail_scaffold.dart';

class OverloadTipsScreen extends StatelessWidget {
  const OverloadTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TipDetailScaffold(
      title: 'Sobrecargas y Extensiones',
      color: Colors.yellow.shade800,
      heroIcon: Icons.power_rounded,
      items: const [
        TipItem(
          icon: Icons.electrical_services_outlined,
          title: 'Evita regletas saturadas',
          description:
              'No conectes varios equipos de alto consumo (calefactores, hornos, aires) en la misma regleta. Reparte la carga en circuitos distintos.',
        ),
        TipItem(
          icon: Icons.cable_outlined,
          title: 'Extensiones solo temporales',
          description:
              'Para usos permanentes, instala nuevas tomas. Las extensiones prolongadas aumentan el riesgo de calentamiento y tropiezos.',
        ),
        TipItem(
          icon: Icons.shield_outlined,
          title: 'Protección adecuada',
          description:
              'Usa regletas con protección contra sobrecargas y certificaciones. Sustituye equipos con cables dañados o enchufes flojos.',
        ),
      ],
    );
  }
}
