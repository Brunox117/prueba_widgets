import 'package:flutter/material.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.sim_card_alert_outlined),
              Text(
                'Reporte: 13487',
                style: textStyles.bodyMedium,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Text(
                'Detalle: ',
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const ReportContainers(title: 'Reporte: ', subtitle: '09333'),
          const ReportContainers(
              title: 'Conductor: ',
              subtitle: 'LLUVIA DEL ROCIO GARZA MELENDEZ'),
          const ReportContainers(
              title: 'Ubicación: ',
              subtitle:
                  'Chihuahua Bachiniva Francisco I. Madero División del Norte Carretera Picacho-Ajusco'),
          const ReportContainers(
              title: 'Tipo de siniestro: ', subtitle: 'Accidente vial'),
          const ReportContainers(
              title: 'Ajustador: ', subtitle: 'SANCHEZ ESPINOZA LENIN'),
        ],
      ),
    );
  }
}

class ReportContainers extends StatelessWidget {
  final String title;
  final String subtitle;
  const ReportContainers({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text(title)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              subtitle,
              overflow: TextOverflow.ellipsis,
            )
          ],
        )
      ],
    );
  }
}
