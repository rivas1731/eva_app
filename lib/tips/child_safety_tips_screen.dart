import 'package:flutter/material.dart';
import 'package:eva_app/tips/widgets/tip_detail_scaffold.dart';

class ChildSafetyTipsScreen extends StatelessWidget {
  const ChildSafetyTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TipDetailScaffold(
      title: 'Protección para Niños',
      color: Colors.blue.shade400,
      heroIcon: Icons.child_friendly_rounded,
      items: const [
        TipItem(
          icon: Icons.outlet_outlined,
          title: 'Protege los enchufes',
          description:
              'Instala tapas de seguridad en tomas accesibles y usa tapas a prueba de niños en regletas.',
        ),
        TipItem(
          icon: Icons.lock_outline,
          title: 'Fuera de su alcance',
          description:
              'Sujeta y recoge cables sueltos. Evita regletas a ras del suelo o sin protección.',
        ),
        TipItem(
          icon: Icons.school_outlined,
          title: 'Educa y supervisa',
          description:
              'Explícales que no deben introducir objetos en enchufes ni tirar de los cables. Mantén supervisión en áreas de riesgo.',
        ),
      ],
    );
  }
}
