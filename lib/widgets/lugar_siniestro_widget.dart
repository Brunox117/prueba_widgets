import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/shared/custom_card.dart';

class LugarSiniestroWidget extends StatelessWidget {
  const LugarSiniestroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCard(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Text('Has llegado al lugar del siniestro'),
          Icon(Icons.place),
        ],
      ),
    );
  }
}
