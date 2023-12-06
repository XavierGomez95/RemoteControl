import 'package:flutter/material.dart';
import 'package:remotecontrol/widgets/directionButton.dart';

class DirectionControl extends StatelessWidget {
  final Function(String direction) onDirectionSelected;
  final double buttonSize;

  const DirectionControl({
    super.key,
    required this.onDirectionSelected,
    this.buttonSize = 60.0, // Tamaño de los botones
  });

  @override
  Widget build(BuildContext context) {
    // Estilo para los botones
    final buttonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      primary: Colors.blueGrey[600], // Color del ícono
      elevation: 4, // Sombra del botón (una sombra más sutil)
      shape: CircleBorder(), // Esto creará un borde circular para el botón
      padding: EdgeInsets.all(20), // Añade un poco de padding si quieres que los botones sean más grandes
    );


    return Padding(
      padding: const EdgeInsets.all(16.0), // Espacio alrededor de la grilla de botones
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Botón de arriba
          DirectionButton(
            icon: Icons.arrow_upward,
            onPressed: () => onDirectionSelected('up'),
            size: buttonSize,
            style: buttonStyle,
          ),
          // Fila del medio con botones izquierdo y derecho
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DirectionButton(
                icon: Icons.arrow_back,
                onPressed: () => onDirectionSelected('left'),
                size: buttonSize,
                style: buttonStyle,
              ),
              SizedBox(width: buttonSize), // Espacio para el botón central
              DirectionButton(
                icon: Icons.arrow_forward,
                onPressed: () => onDirectionSelected('right'),
                size: buttonSize,
                style: buttonStyle,
              ),
            ],
          ),
          // Botón de abajo
          DirectionButton(
            icon: Icons.arrow_downward,
            onPressed: () => onDirectionSelected('down'),
            size: buttonSize,
            style: buttonStyle,
          ),
        ],
      ),
    );
  }
}

