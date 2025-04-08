import 'package:flutter/material.dart';

class ReportWidget extends StatelessWidget {
  final String? reporte;
  final String? conductor;
  final String? ubicacion;
  final String? tipoSiniestro;
  final String? ajustador;
  const ReportWidget(
      {super.key,
      this.reporte,
      this.conductor,
      this.ubicacion,
      this.tipoSiniestro,
      this.ajustador});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.sim_card_alert_outlined),
              const SizedBox(width: 8),
              Text(
                'Reporte: ${reporte ?? '13487'}',
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
          ReportContainers(title: 'Reporte: ', subtitle: reporte ?? '13487'),
          const SizedBox(height: 10),
          ReportContainers(
              title: 'Conductor: ',
              subtitle: (conductor == null)
                  ? 'LLUVIA DEL ROCIO GARZA MELENDEZ'
                  : conductor!),
          const SizedBox(height: 10),
          ReportContainers(
              title: 'Ubicación: ',
              subtitle: (ubicacion == null)
                  ? 'Chihuahua Bachiniva Francisco I. Madero División del Norte Carretera Picacho-Ajusco'
                  : ubicacion!),
          const SizedBox(height: 10),
          ReportContainers(
              title: 'Tipo de siniestro: ',
              subtitle:
                  (tipoSiniestro == null) ? 'Accidente vial' : tipoSiniestro!),
          const SizedBox(height: 10),
          ReportContainers(
              title: 'Ajustador: ',
              subtitle:
                  (ajustador == null) ? 'SANCHEZ ESPINOZA LENIN' : ajustador!),
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
