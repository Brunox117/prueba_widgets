import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/shared/custom_list_tile.dart';

class ActualizarUbicacion extends StatelessWidget {
  const ActualizarUbicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leadingIcon: Icons.place,
      title: 'Actualizar ubicación',
      onPressed: () {},
    );
  }
}
