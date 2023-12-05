import 'package:flutter/material.dart';

class VelocityControl extends StatefulWidget {
  const VelocityControl({super.key});

  @override
  _VelocityControlState createState() => _VelocityControlState();
}

class _VelocityControlState extends State<VelocityControl> {
  double velocity = 0.0;

  void increaseVelocity() {
    setState(() {
      velocity++;
      // Aquí iría la lógica para comunicarse con el servicio del robot y actualizar su velocidad
    });
  }

  void decreaseVelocity() {
    setState(() {
      velocity--;
      // Aquí iría la lógica para comunicarse con el servicio del robot y actualizar su velocidad
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Velocity'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: decreaseVelocity,
            ),
            Text('${velocity.toStringAsFixed(1)}'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: increaseVelocity,
            ),
          ],
        ),
      ],
    );
  }
}
