import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/shared/custom_list_tile.dart';

class MarcarTermino extends StatelessWidget {
  const MarcarTermino({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leadingIcon: Icons.check,
      title: 'Marcar termino.',
      onPressed: () {},
    );
  }
}
