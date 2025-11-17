import 'package:flutter/material.dart';
import 'package:eva_app/tips/widgets/tip_detail_scaffold.dart';

class WaterElectricityFirstAidScreen extends StatelessWidget {
  const WaterElectricityFirstAidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Colors.blue.shade500;
    return TipDetailScaffold(
      title: 'Agua + electricidad',
      color: color,
      heroIcon: Icons.water_drop_rounded,
      items: const [
        TipItem(
          icon: Icons.block_rounded,
          title: 'Paso 1: No entrar en el agua',
          description:
              'Si la víctima está en una zona mojada o dentro del agua, no te acerques. El agua conduce la electricidad.',
        ),
        TipItem(
          icon: Icons.power_off_rounded,
          title: 'Paso 2: Cortar la electricidad',
          description:
              'Baja el interruptor general. No toques equipos ni superficies metálicas mojadas antes de cortar la energía.',
        ),
        TipItem(
          icon: Icons.pan_tool_alt_rounded,
          title: 'Paso 3: Separar con material no conductor',
          description:
              'Solo si no pudiste cortar la luz, usa madera seca o goma para apartar a la víctima. Evita objetos metálicos o húmedos.',
        ),
        TipItem(
          icon: Icons.call_rounded,
          title: 'Paso 4: Llamar a emergencias',
          description:
              'Toda víctima de descarga debe ser evaluada. Llama al 911 o al número local una vez la escena sea segura.',
        ),
        TipItem(
          icon: Icons.search_rounded,
          title: 'Paso 5: Evaluar y actuar',
          description:
              'Comprueba consciencia, respiración y pulso. Si no respira o no hay pulso, inicia RCP inmediatamente.',
        ),
        TipItem(
          icon: Icons.healing_rounded,
          title: 'Paso 6: Quemaduras y cuidado',
          description:
              'Cubre quemaduras con gasa o paño limpio y seco. No apliques cremas ni hielo.',
        ),
        TipItem(
          icon: Icons.verified_user_rounded,
          title: 'Paso 7: No reenergizar hasta revisión',
          description:
              'No vuelvas a energizar la zona hasta que un profesional verifique instalaciones y dispositivos (diferenciales/GFCI, tomas, aparatos).',
        ),
      ],
    );
  }
}
