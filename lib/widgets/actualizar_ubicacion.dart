import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/shared/custom_card.dart';

class ActualizarUbicacion extends StatelessWidget {
  const ActualizarUbicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      paddingVertical: 0,
        child: Row(
      children: [
        const SizedBox(
          height: 50,
        ),
        const Icon(Icons.place),
        const SizedBox(
          width: 10,
        ),
        const Text('Actualizar ubicación'),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))
      ],
    ));
  }
}
