import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/shared/custom_list_tile.dart';

class MarcarArriboWidget extends StatelessWidget {
  const MarcarArriboWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leadingIcon: Icons.message,
      title: 'Marcar arribo',
      onPressed: () {},
    );
  }
}
