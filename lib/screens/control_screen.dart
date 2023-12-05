import 'package:flutter/material.dart';
import '../widgets/direction_control.dart';
import '../widgets/velocity_control.dart';
// Importa otros widgets personalizados que crees.

class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control Robot'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          DirectionControl(onDirectionSelected: (String direction) {  },),
          VelocityControl(),
          // Añade aquí otros controles necesarios.
        ],
      ),
    );
  }
}
