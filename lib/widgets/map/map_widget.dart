import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/shared/custom_card.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return CustomCard(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'Mapa',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ));
  }
}
