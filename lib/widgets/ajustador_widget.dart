import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/shared/custom_card.dart';

class AjustadorWidget extends StatelessWidget {
  final String? conductor;
  const AjustadorWidget({super.key, this.conductor});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          Row(
            children: [
              const Column(
                children: [Icon(Icons.person)],
              ),
              const Spacer(),
              Column(
                children: [
                  const Text("Tu ajustador es:"),
                  Text((conductor == null)
                      ? 'Sanchéz Espinoza Lenin'
                      : conductor!),
                ],
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
