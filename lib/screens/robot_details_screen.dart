import 'package:flutter/material.dart';
import '../services/robot_service.dart';

class RobotDetailsScreen extends StatelessWidget {
  const RobotDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final robotService = RobotService(); // Asumiendo que esta clase tiene los datos del robot

    return Scaffold(
      appBar: AppBar(
        title: const Text('Robot Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.thermostat_rounded, color: Colors.blue),
              title: const Text('Temperature'),
              subtitle: Text('${robotService.robot.temperature.toStringAsFixed(2)} °C'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.sync_rounded, color: Colors.green),
              title: const Text('Rotations'),
              subtitle: Text('${robotService.robot.rotations} RPM'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.linear_scale, color: Colors.red),
              title: const Text('Distance'),
              subtitle: Text('${robotService.robot.distance.toStringAsFixed(2)} meters'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.location_on, color: Colors.purple),
              title: const Text('Position'),
              subtitle: Text('Lat: ${robotService.robot.position.latitude}, '
                  'Lon: ${robotService.robot.position.longitude}'),
            ),
          ),
          // Aquí puedes añadir más tarjetas para otras características
        ],
      ),
    );
  }
}
