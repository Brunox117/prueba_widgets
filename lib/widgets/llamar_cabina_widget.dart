import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/shared/custom_list_tile.dart';

class LlamarCabinaWidget extends StatelessWidget {
  const LlamarCabinaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leadingIcon: Icons.phone_in_talk_rounded,
      title: 'Llamar cabina',
      onPressed: () {},
    );
  }
}
