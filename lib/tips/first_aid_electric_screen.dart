import 'package:flutter/material.dart';
import 'package:eva_app/tips/widgets/tip_detail_scaffold.dart';

class FirstAidElectricScreen extends StatelessWidget {
  const FirstAidElectricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Colors.red.shade700;
    return TipDetailScaffold(
      title: 'Primeros Auxilios Eléctricos',
      color: color,
      heroIcon: Icons.health_and_safety_rounded,
      items: const [
        TipItem(
          icon: Icons.bolt_rounded,
          title: 'Contacto con cables expuestos o dañados',
          description:
              'Causa: Cables de electrodomésticos o extensiones pelados, agrietados o rotos. Tocar el cobre expuesto mientras está conectado.\n\nRiesgo: Electrocución directa.',
        ),
        TipItem(
          icon: Icons.power_rounded,
          title: 'Manipulación de tomas de corriente (enchufes)',
          description:
              'Causa: Reparar un enchufe sin cortar la electricidad o introducir objetos metálicos (tijeras, ganchos, cubiertos).\n\nRiesgo: Electrocución y quemaduras graves.',
        ),
        TipItem(
          icon: Icons.water_drop_rounded,
          title: 'Combinación de agua y electricidad',
          description:
              'Causa: Usar/tocar aparatos eléctricos con manos mojadas, descalzo sobre suelo húmedo o cerca de la ducha/bañera.\n\nRiesgo: El agua reduce la resistencia de la piel; incluso descargas pequeñas pueden ser mortales.',
        ),
        TipItem(
          icon: Icons.electrical_services_rounded,
          title: 'Sobrecarga de extensiones y regletas',
          description:
              'Causa: Conectar muchos aparatos de alto consumo en una sola toma.\n\nRiesgo: Sobrecalentamiento, derretimiento del aislante y posible incendio; si se tocan los cables, hay electrocución.',
        ),
        TipItem(
          icon: Icons.kitchen_rounded,
          title: 'Aparatos defectuosos o antiguos',
          description:
              'Causa: Fallo interno que energiza la carcasa metálica (nevera, lavadora, tostadora).\n\nRiesgo: Al tocar el equipo, la corriente atraviesa el cuerpo hacia el suelo.',
        ),
        TipItem(
          icon: Icons.block_rounded,
          title: 'Paso 1: NO tocar a la víctima',
          description:
              'Si la persona sigue en contacto con la fuente, tocarla te convierte en una segunda víctima. Asegura primero tu seguridad.',
        ),
        TipItem(
          icon: Icons.power_off_rounded,
          title: 'Paso 2: Cortar la fuente de electricidad',
          description:
              'Ruta 1 (ideal): Ve al tablero eléctrico y baja el interruptor general.\n\nRuta 2 (rápida): Si es seguro, desenchufa el aparato SIN tocar a la víctima ni cables dañados.',
        ),
        TipItem(
          icon: Icons.pan_tool_alt_rounded,
          title:
              'Paso 3: Separar a la víctima (solo si NO pudiste cortar la luz)',
          description:
              'Usa un objeto NO conductor y seco para apartarla.\n\nMateriales SEGUROS: palo de escoba (madera seca), silla de madera, alfombra de goma, libro grueso.\nMateriales PELIGROSOS: cualquier metal o material húmedo.',
        ),
        TipItem(
          icon: Icons.call_rounded,
          title: 'Paso 4: Llamar a emergencias',
          description:
              'Una vez separada la víctima o cortada la electricidad, llama de inmediato (911 o número local). Toda electrocución debe evaluarse médicamente por posibles arritmias o lesiones internas.',
        ),
        TipItem(
          icon: Icons.search_rounded,
          title: 'Paso 5: Evaluar a la víctima (solo si la escena es segura)',
          description:
              '¿Está consciente? Háblale.\n¿Respira? Observa el pecho, siente su aliento.\n¿Tiene pulso? Valora antes de actuar.',
        ),
        TipItem(
          icon: Icons.favorite_rounded,
          title: 'Paso 6: Iniciar RCP si no respira o no hay pulso',
          description:
              'La descarga eléctrica puede detener el corazón. Inicia RCP y continúa hasta la llegada de ayuda médica.',
        ),
        TipItem(
          icon: Icons.healing_rounded,
          title: 'Paso 7: Atender las quemaduras',
          description:
              'Las quemaduras suelen existir en punto de entrada y salida. Cubre con gasa estéril o paño limpio y seco.\nNO uses ungüentos, cremas, hielo ni mantas (las fibras pueden pegarse).',
        ),
        TipItem(
          icon: Icons.do_not_step_rounded,
          title: 'Paso 8: No mover a la víctima',
          description:
              'Puede haber fracturas o lesión de columna por contracciones violentas. No la muevas salvo peligro inmediato (p. ej., incendio).',
        ),
        TipItem(
          icon: Icons.fire_extinguisher_rounded,
          title: 'Si el accidente provoca FUEGO',
          description:
              'NUNCA uses agua si el fuego es de origen eléctrico y hay electricidad conectada.\nCorta la electricidad desde el interruptor general si es seguro.\nUsa extintor Clase C. Si el fuego es muy pequeño (p. ej., en tostadora), bicarbonato puede ayudar. Evacúa y llama a bomberos.',
        ),
      ],
    );
  }
}
