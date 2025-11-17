import 'package:flutter/material.dart';
import 'package:eva_app/tips/widgets/tip_detail_scaffold.dart';

class ElectricalInstallationsTipsScreen extends StatelessWidget {
  const ElectricalInstallationsTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TipDetailScaffold(
      title: 'Instalaciones Eléctricas',
      color: Colors.orange.shade400,
      heroIcon: Icons.electrical_services_rounded,
      items: const [
        TipItem(
          icon: Icons.engineering_outlined,
          title: 'Profesionales certificados',
          description:
              'Para instalaciones o reparaciones, contrata personal certificado. Evita empalmes caseros o conexiones sin norma.',
        ),
        TipItem(
          icon: Icons.rule_folder_outlined,
          title: 'Material y calibre correctos',
          description:
              'Respeta la normativa local: calibres, canalizaciones y protecciones adecuadas a la carga instalada.',
        ),
        TipItem(
          icon: Icons.shield_outlined,
          title: 'Protecciones en buen estado',
          description:
              'Usa disyuntores y diferenciales operativos. Señaliza el tablero y realiza pruebas periódicas.',
        ),
      ],
    );
  }
}
