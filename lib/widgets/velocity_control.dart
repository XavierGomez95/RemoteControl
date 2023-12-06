import 'package:flutter/material.dart';

class VelocityControl extends StatefulWidget {
  final double sliderHeight;

  const VelocityControl({super.key, this.sliderHeight = 40.0});

  @override
  _VelocityControlState createState() => _VelocityControlState();
}

class _VelocityControlState extends State<VelocityControl> {
  double velocity = 0.0;

  void increaseVelocity() {
    setState(() {
      velocity++;
    });
  }

  void decreaseVelocity() {
    if (velocity > 0) {
      setState(() {
        velocity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define el estilo del botón aquí para reutilizarlo en ambos botones
    final buttonStyle = ElevatedButton.styleFrom(
      primary: Colors.blueGrey[600], // Asume esto es el color de tus botones de dirección
      onPrimary: Colors.white, // Color del texto/icono
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100), // Bordes redondeados
      ),
      padding: EdgeInsets.zero, // Elimina el padding predeterminado
    );

    return Column(
      children: [
        const Text('Velocity', style: TextStyle(fontSize: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: buttonStyle,
              onPressed: decreaseVelocity,
              child: const Icon(Icons.remove, size: 48),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16), // Espacio horizontal entre texto y botones
              child: Text('${velocity.toStringAsFixed(1)}', style: TextStyle(fontSize: widget.sliderHeight)),
            ),
            ElevatedButton(
              style: buttonStyle,
              onPressed: increaseVelocity,
              child: const Icon(Icons.add, size: 48),
            ),
          ],
        ),
      ],
    );
  }
}
