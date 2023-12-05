import 'package:flutter/material.dart';

class DirectionControl extends StatelessWidget {
  final Function(String direction) onDirectionSelected;

  const DirectionControl({super.key, required this.onDirectionSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DirectionButton(
              icon: Icons.arrow_back,
              onPressed: () => onDirectionSelected('left'),
            ),
            DirectionButton(
              icon: Icons.arrow_upward,
              onPressed: () => onDirectionSelected('up'),
            ),
            DirectionButton(
              icon: Icons.arrow_forward,
              onPressed: () => onDirectionSelected('right'),
            ),
          ],
        ),
        DirectionButton(
          icon: Icons.arrow_downward,
          onPressed: () => onDirectionSelected('down'),
        ),
      ],
    );
  }
}

class DirectionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const DirectionButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
