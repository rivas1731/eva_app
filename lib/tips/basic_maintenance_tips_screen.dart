import 'package:flutter/material.dart';
import 'package:eva_app/tips/widgets/tip_detail_scaffold.dart';

class BasicMaintenanceTipsScreen extends StatelessWidget {
  const BasicMaintenanceTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TipDetailScaffold(
      title: 'Mantenimiento Básico',
      color: Colors.green.shade400,
      heroIcon: Icons.build_rounded,
      items: const [
        TipItem(
          icon: Icons.search_outlined,
          title: 'Inspección regular',
          description:
              'Detecta cables pelados, enchufes flojos y olores a quemado. Reemplaza de inmediato las partes defectuosas.',
        ),
        TipItem(
          icon: Icons.cleaning_services_outlined,
          title: 'Limpieza y ventilación',
          description:
              'El polvo acumula calor. Limpia tomas, regletas y detrás de equipos. Asegura ventilación en electrodomésticos.',
        ),
        TipItem(
          icon: Icons.health_and_safety_outlined,
          title: 'Prueba de seguridad',
          description:
              'Prueba el botón de test de tu diferencial (GFCI/RCD) mensualmente y restablécelo para asegurar su funcionamiento.',
        ),
      ],
    );
  }
}
