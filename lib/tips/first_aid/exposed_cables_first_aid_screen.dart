import 'package:flutter/material.dart';
import 'package:eva_app/tips/widgets/tip_detail_scaffold.dart';

class ExposedCablesFirstAidScreen extends StatelessWidget {
  const ExposedCablesFirstAidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Colors.red.shade600;
    return TipDetailScaffold(
      title: 'Cables expuestos o dañados',
      color: color,
      heroIcon: Icons.bolt_rounded,
      items: const [
        TipItem(
          icon: Icons.block_rounded,
          title: 'Paso 1: No tocar a la víctima',
          description:
              'Si aún está en contacto con el cable, no la toques. Evita convertirte en una segunda víctima.',
        ),
        TipItem(
          icon: Icons.power_off_rounded,
          title: 'Paso 2: Cortar la electricidad',
          description:
              'Baja el interruptor general en el tablero eléctrico. Si no es posible, desenchufa el equipo SOLO si puedes hacerlo sin riesgo (sin tocar cobre ni zonas dañadas).',
        ),
        TipItem(
          icon: Icons.pan_tool_alt_rounded,
          title: 'Paso 3: Separar con objeto no conductor',
          description:
              'Si no pudiste cortar la luz, usa madera seca, goma o un libro grueso para empujar el cable o apartar a la víctima. Nunca uses metal ni objetos húmedos.',
        ),
        TipItem(
          icon: Icons.call_rounded,
          title: 'Paso 4: Llamar a emergencias',
          description:
              'Llama al 911 (o número local) tan pronto la escena esté segura. La electrocución puede causar arritmias y lesiones internas.',
        ),
        TipItem(
          icon: Icons.search_rounded,
          title: 'Paso 5: Evaluar: consciencia, respiración y pulso',
          description:
              'Habla con la persona; observa si respira y comprueba el pulso si sabes hacerlo. Si no respira o no hay pulso, continúa con RCP.',
        ),
        TipItem(
          icon: Icons.favorite_rounded,
          title: 'Paso 6: Iniciar RCP si es necesario',
          description:
              'Inicia RCP de inmediato y continúa hasta la llegada de ayuda profesional.',
        ),
        TipItem(
          icon: Icons.healing_rounded,
          title: 'Paso 7: Atender quemaduras',
          description:
              'Cubre con gasa estéril o paño limpio y seco. No apliques cremas, ungüentos, hielo ni mantas con fibras sueltas.',
        ),
        TipItem(
          icon: Icons.do_not_step_rounded,
          title: 'Paso 8: No mover a la víctima',
          description:
              'Podría haber lesiones de columna o fracturas. No la muevas salvo peligro inmediato (p. ej., fuego).',
        ),
        TipItem(
          icon: Icons.warning_amber_rounded,
          title: 'Paso 9: Inhabilitar el cable y pedir revisión',
          description:
              'Aísla y etiqueta el cable/artefacto. No lo vuelvas a usar. Llama a un electricista para reemplazo o reparación segura.',
        ),
      ],
    );
  }
}
