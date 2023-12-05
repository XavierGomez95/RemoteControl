import 'package:flutter/material.dart';

class TemperatureIndicator extends StatelessWidget {
  final double temperature;

  const TemperatureIndicator({super.key, required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Temperature'),
        Text('${temperature.toStringAsFixed(1)} °C'),
        // Añade más UI y lógica según sea necesario
      ],
    );
  }
}
