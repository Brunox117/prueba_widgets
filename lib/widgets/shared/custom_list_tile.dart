import 'package:flutter/material.dart';
import 'package:prueba_widgets/widgets/shared/custom_card.dart';

class CustomListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final VoidCallback? onPressed;

  const CustomListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      paddingVertical: 0,
      child: Row(
        children: [
          const SizedBox(
            height: 50,
          ),
          Icon(leadingIcon),
          const SizedBox(
            width: 10,
          ),
          Text(title),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
} 