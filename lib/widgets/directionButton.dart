import 'package:flutter/material.dart';


class DirectionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double size;
  final ButtonStyle style;

  const DirectionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.size,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: Icon(
        icon,
        size: size / 2, // Tamaño del ícono relativo al del botón
        color: Colors.white,
      ),
    );
  }
}
