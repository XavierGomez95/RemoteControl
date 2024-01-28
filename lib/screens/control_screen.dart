import 'package:flutter/material.dart';
import '../widgets/direction_control.dart';
import '../widgets/velocity_control.dart';
import 'dart:io';




class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  void _handleDirectionSelected(String direction) {
    _sendMessageToRaspberry(direction);
    print('Direction selected: $direction');
  }

  void _handleSpeedSelected(String speed) {
    _sendMessageToRaspberry(speed);
    print('Speed selected: $speed');
  }

  void _sendMessageToRaspberry(String message) async {
    try {
      Socket socket = await Socket.connect('192.168.1.126', 8080);
      socket.write(message);
      socket.close();
    } catch (e) {
      print(e);

      SnackBar(
          content: Text('Error connecting to the server: $e'),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control Robot'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DirectionControl(
                onDirectionSelected: _handleDirectionSelected,
                buttonSize: 130, // Tamaño personalizado para los botones
              ),// Espacio entre los controles
              VelocityControl(
                onSpeedSelected: _handleSpeedSelected,
                sliderHeight: 40, // Altura personalizada para el control deslizante
              ),
              // Añade aquí otros controles si son necesarios
            ],
          ),
        ),
      ),
    );
  }
}
