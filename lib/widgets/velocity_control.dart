import 'package:flutter/material.dart';

class VelocityControl extends StatefulWidget {
  final double sliderHeight;
  final Function(String speed) onSpeedSelected;

  const VelocityControl({
    super.key,
    this.sliderHeight = 40.0,
    required this.onSpeedSelected});

  @override
  _VelocityControlState createState() => _VelocityControlState();
}

class _VelocityControlState extends State<VelocityControl> {
  double velocity = 0.0;

  void increaseVelocity() {
    setState(() {
      velocity++;
      widget.onSpeedSelected(velocity.toString());
    });
  }

  void decreaseVelocity() {
    if (velocity > 0) {
      setState(() {
        velocity--;
        widget.onSpeedSelected(velocity.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define el estilo del botón aquí para reutilizarlo en ambos botones
    final buttonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: Colors.blueGrey[600], // Color del texto/icono
      shape: const CircleBorder(),
      padding: EdgeInsets.zero, // Elimina el padding predeterminado
    );

    return Column(
      children: [
        const Text('Speed', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
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
