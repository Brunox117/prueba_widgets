import 'package:flutter/material.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.sim_card_alert_outlined),
              const SizedBox(width: 8),
              Text(
                'Reporte: 13487',
                style: textStyles.titleMedium,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Detalle:',
            style: textStyles.titleSmall,
          ),
          const SizedBox(
            height: 15,
          ),
          const ReportContainers(title: 'Reporte: ', subtitle: '09333'),
          const SizedBox(height: 10),
          const ReportContainers(
              title: 'Conductor: ',
              subtitle: 'LLUVIA DEL ROCIO GARZA MELENDEZ'),
          const SizedBox(height: 10),
          const ReportContainers(
              title: 'Ubicación: ',
              subtitle:
                  'Chihuahua Bachiniva Francisco I. Madero División del Norte Carretera Picacho-Ajusco'),
          const SizedBox(height: 10),
          const ReportContainers(
              title: 'Tipo de siniestro: ', subtitle: 'Accidente vial'),
          const SizedBox(height: 10),
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium)
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    subtitle,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
