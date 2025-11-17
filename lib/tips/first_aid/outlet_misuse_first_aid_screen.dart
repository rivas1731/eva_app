import 'package:flutter/material.dart';
import 'package:eva_app/tips/widgets/tip_detail_scaffold.dart';

class OutletMisuseFirstAidScreen extends StatelessWidget {
  const OutletMisuseFirstAidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Colors.orange.shade700;
    return TipDetailScaffold(
      title: 'Manipulación de tomas (enchufes)',
      color: color,
      heroIcon: Icons.power_rounded,
      items: const [
        TipItem(
          icon: Icons.block_rounded,
          title: 'Paso 1: No tocar a la víctima ni el enchufe',
          description:
              'Si hay contacto con el enchufe o con un objeto dentro de él, no toques a la persona ni el metal.',
        ),
        TipItem(
          icon: Icons.power_off_rounded,
          title: 'Paso 2: Cortar la electricidad',
          description:
              'Baja el interruptor general. Si no es posible, corta el circuito del área. No intentes retirar el objeto metálico mientras haya energía.',
        ),
        TipItem(
          icon: Icons.pan_tool_alt_rounded,
          title: 'Paso 3: Retiro del objeto solo si es seguro',
          description:
              'Si el circuito está sin energía y el objeto queda suelto, retíralo con un material no conductor (guantes de goma seca, pinza con mango aislado). Si está trabado, espera a un profesional.',
        ),
        TipItem(
          icon: Icons.call_rounded,
          title: 'Paso 4: Llamar a emergencias',
          description:
              'Toda descarga debe ser evaluada. Llama al 911 (o número local) y describe la situación.',
        ),
        TipItem(
          icon: Icons.healing_rounded,
          title: 'Paso 5: Atender quemaduras en mano',
          description:
              'Enfría con agua corriente (10–20 min) si la piel no está abierta; luego cubre con gasa/paño limpio y seco. No uses pomadas ni hielo.',
        ),
        TipItem(
          icon: Icons.favorite_rounded,
          title: 'Paso 6: RCP si no respira o no hay pulso',
          description:
              'Inicia RCP de inmediato y continúa hasta la llegada de ayuda profesional.',
        ),
        TipItem(
          icon: Icons.verified_user_rounded,
          title: 'Paso 7: Prevención posterior',
          description:
              'Instala tapas de seguridad para niños, reemplaza enchufes dañados por tomas seguras y considera diferenciales (GFCI) en zonas sensibles.',
        ),
      ],
    );
  }
}
