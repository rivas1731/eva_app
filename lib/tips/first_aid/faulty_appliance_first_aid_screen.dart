import 'package:flutter/material.dart';
import 'package:eva_app/tips/widgets/tip_detail_scaffold.dart';

class FaultyApplianceFirstAidScreen extends StatelessWidget {
  const FaultyApplianceFirstAidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Colors.green.shade600;
    return TipDetailScaffold(
      title: 'Aparatos defectuosos o antiguos',
      color: color,
      heroIcon: Icons.kitchen_rounded,
      items: const [
        TipItem(
          icon: Icons.block_rounded,
          title: 'Paso 1: No tocar la carcasa',
          description:
              'Si sospechas que la carcasa está energizada, no la toques ni permitas que otros lo hagan.',
        ),
        TipItem(
          icon: Icons.power_off_rounded,
          title: 'Paso 2: Cortar la electricidad',
          description:
              'Baja el interruptor general o desconecta el circuito. Desenchufa solo si es seguro y con la electricidad cortada.',
        ),
        TipItem(
          icon: Icons.call_rounded,
          title: 'Paso 3: Llamar a emergencias si hubo descarga',
          description:
              'Toda electrocución requiere evaluación médica por posibles arritmias o lesiones internas.',
        ),
        TipItem(
          icon: Icons.favorite_rounded,
          title: 'Paso 4: RCP si no respira o no hay pulso',
          description:
              'Inicia RCP de inmediato hasta que llegue ayuda profesional.',
        ),
        TipItem(
          icon: Icons.healing_rounded,
          title: 'Paso 5: Quemaduras',
          description:
              'Cubre con gasa/paño limpio y seco; no apliques cremas ni hielo.',
        ),
        TipItem(
          icon: Icons.handyman_rounded,
          title: 'Paso 6: Inhabilitar y revisar el equipo',
          description:
              'Señaliza el aparato, no lo uses. Envía a servicio técnico o reemplázalo. Verifica tierra física, tomas, diferenciales (GFCI).',
        ),
      ],
    );
  }
}
