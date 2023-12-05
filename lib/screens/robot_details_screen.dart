import 'package:flutter/material.dart';
import '../services/robot_service.dart';
import '../widgets/temperature_indicator.dart';
import '../widgets/distance_indicator.dart';
// Importa otros widgets personalizados que crees.

class RobotDetailsScreen extends StatelessWidget {
  const RobotDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Asumiendo que tienes un modelo de robot y un servicio para obtener los datos.
    final robotService = RobotService(); // Esto normalmente vendría de un provider o similar.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Robot Details'),
      ),
      body: ListView(
        children: [
          TemperatureIndicator(temperature: robotService.robot.temperature),
          // Añade aquí indicadores de distancia y otros controles.
        ],
      ),
    );
  }
}
