import 'package:flutter/material.dart';
import 'package:remotecontrol/widgets/directionButton.dart';

class DirectionControl extends StatefulWidget {
  final Function(String direction) onDirectionSelected;
  final double buttonSize;
  final String returnText;
  final String bullText;

  DirectionControl({
    super.key,
    required this.onDirectionSelected,
    this.returnText = '180°',
    this.bullText = 'Toro mecánico',
    this.buttonSize = 60.0, // Tamaño de los botones
  });

  @override
  State<DirectionControl> createState() => _DirectionControlState();
}

class _DirectionControlState extends State<DirectionControl> {
  bool bullState = false;

  @override
  Widget build(BuildContext context) {
    // Estilo para los botones
    final buttonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blueGrey[600], // Color del ícono
      elevation: 4, // Sombra del botón (una sombra más sutil)
      shape: CircleBorder(), // Esto creará un borde circular para el botón
      padding: EdgeInsets.all(20), // Añade un poco de padding si quieres que los botones sean más grandes
    );


    return Padding(
      padding: const EdgeInsets.all(4.0), // Espacio alrededor de la grilla de botones
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Botón de subir y bajar el toro mecánico
          Transform.rotate(
            angle: -1.5708, // 0.5 pi radianes
            child: DirectionButton(
              icon: Icons.compare_arrows,
              onPressed: () {
                // Cambia el estado de bullState y llama a la función correspondiente
                bullState = !bullState; // Cambia el estado a su contrario
                widget.onDirectionSelected(bullState ? 'UP' : 'DOWN');
              },
              size: widget.buttonSize,
              style: buttonStyle,
            ),
          ),
          Text(
            widget.bullText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ), // Estilo del texto (ajusta según sea necesario)
          ),
          // Fila del medio con botones izquierdo y derecho
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DirectionButton(
                icon: Icons.arrow_back,
                onPressed: () => widget.onDirectionSelected('left'),
                size: widget.buttonSize,
                style: buttonStyle,
              ),
              SizedBox(width: widget.buttonSize), // Espacio para el botón central
              DirectionButton(
                icon: Icons.arrow_forward,
                onPressed: () => widget.onDirectionSelected('right'),
                size: widget.buttonSize,
                style: buttonStyle,
              ),
            ],
          ),
          // Botón de abajo
       // Radianes equivalentes a 90 grados en sentido antihorario
          DirectionButton(
            icon: Icons.u_turn_left,
            onPressed: () => widget.onDirectionSelected('180 degrees'),
            size: widget.buttonSize,
            style: buttonStyle,
          ),
          Text(
            widget.returnText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ), // Estilo del texto (ajusta según sea necesario)
          ),
        ],
      ),
    );
  }
}

