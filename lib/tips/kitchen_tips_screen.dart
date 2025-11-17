import 'package:flutter/material.dart';
import 'package:eva_app/tips/widgets/tip_detail_scaffold.dart';

class KitchenTipsScreen extends StatelessWidget {
  const KitchenTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TipDetailScaffold(
      title: 'Seguridad en la Cocina',
      color: Colors.red.shade400,
      heroIcon: Icons.kitchen_rounded,
      items: const [
        TipItem(
          icon: Icons.water_drop_outlined,
          title: 'Mantén la electricidad lejos del agua',
          description:
              'Ubica cables, regletas y enchufes lejos del fregadero y zonas húmedas. Usa tomas con protección diferencial (GFCI/RCD) en la cocina.',
        ),
        TipItem(
          icon: Icons.soup_kitchen_outlined,
          title: 'Evita sobrecargar tomas',
          description:
              'Electrodomésticos de alto consumo (microondas, hornos, cafeteras) deben ir en tomas separadas. Evita adaptadores múltiples permanentes.',
        ),
        TipItem(
          icon: Icons.power_off_outlined,
          title: 'Desconecta al terminar',
          description:
              'Apaga y desconecta freidoras, hornos eléctricos y planchas al terminar. Mantén cables sin tensión y alejados del calor.',
        ),
      ],
    );
  }
}
