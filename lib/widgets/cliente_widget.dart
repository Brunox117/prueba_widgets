import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/shared/custom_card.dart';

class ClienteWidget extends StatelessWidget {
  final String? nombreCliente;
  final String? descricpcionCarro;
  const ClienteWidget({super.key, this.nombreCliente, this.descricpcionCarro});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        child: Column(
      children: [
        const Text('Conductor: '),
        Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(
              width: 10,
            ),
            Text((nombreCliente == null)
                ? 'LLUVIA DEL ROCIO GARZA MELENDEZ'
                : nombreCliente!),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.car_crash),
            const SizedBox(
              width: 10,
            ),
            Text((descricpcionCarro == null)
                ? 'FIAT PALIO SEDAN C/A AC CO BLANCO'
                : descricpcionCarro!),
          ],
        ),
      ],
    ));
  }
}
