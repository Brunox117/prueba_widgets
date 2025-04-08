import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/shared/custom_card.dart';

class ClienteWidget extends StatelessWidget {
  const ClienteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        child: Column(
      children: [
        Text('Conductor: '),
        Row(
          children: [
            Icon(Icons.person),
            SizedBox(
              width: 10,
            ),
            Text('LLUVIA DEL ROCIO GARZA MELENDEZ'),
          ],
        ),
        Row(
          children: [
            Icon(Icons.car_crash),
            SizedBox(
              width: 10,
            ),
            Text('FIAT PALIO SEDAN C/A AC CO BLANCO'),
          ],
        ),
      ],
    ));
  }
}
