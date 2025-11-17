import 'package:flutter/material.dart';
import 'package:eva_app/tips/widgets/tip_detail_scaffold.dart';

class PowerStripOverloadFirstAidScreen extends StatelessWidget {
  const PowerStripOverloadFirstAidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Colors.amber.shade800;
    return TipDetailScaffold(
      title: 'Sobrecarga en regletas/extensiones',
      color: color,
      heroIcon: Icons.electrical_services_rounded,
      items: const [
        TipItem(
          icon: Icons.power_off_rounded,
          title: 'Paso 1: Cortar la electricidad',
          description:
              'Baja el interruptor general o el circuito del área. No toques cables derretidos o chispeantes.',
        ),
        TipItem(
          icon: Icons.fire_extinguisher_rounded,
          title: 'Paso 2: Si hay fuego, nunca usar agua',
          description:
              'Usa extintor Clase C o bicarbonato para fuegos pequeños (p. ej., tostadora). Si crece, evacúa y llama a bomberos.',
        ),
        TipItem(
          icon: Icons.call_rounded,
          title: 'Paso 3: Llamar a emergencias si hay heridos',
          description:
              'Contacta al 911 o número local. La electrocución/ inhalación de humo requiere evaluación médica.',
        ),
        TipItem(
          icon: Icons.healing_rounded,
          title: 'Paso 4: Atender lesiones',
          description:
              'Cubre quemaduras con gasa/paño limpio y seco. No apliques cremas ni hielo. RCP si no respira/no hay pulso.',
        ),
        TipItem(
          icon: Icons.warning_amber_rounded,
          title: 'Paso 5: No volver a usar la regleta',
          description:
              'Desecha la regleta y cables dañados. Reduce la carga en el circuito; evita conectar equipos de alto consumo en una sola toma.',
        ),
        TipItem(
          icon: Icons.engineering_rounded,
          title: 'Paso 6: Revisión profesional',
          description:
              'Pide a un electricista que revise el circuito. Considera protectores contra sobretensiones y distribución de cargas en circuitos separados.',
        ),
      ],
    );
  }
}
