import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/shared/custom_card.dart';

class ArriboAjustador extends StatelessWidget {
  const ArriboAjustador({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Text("Tu ajustador está en el lugar del siniestro"),
          Text('Tu ajustador llegó'),
          Icon(Icons.car_crash_outlined)
        ],
      ),
    );
  }
}
