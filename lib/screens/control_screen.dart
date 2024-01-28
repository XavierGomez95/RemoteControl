import 'package:flutter/material.dart';
import '../velocity_controller.dart';
import '../widgets/direction_control.dart';
import '../widgets/velocity_control.dart';
import 'dart:io';

class ControlScreen extends StatefulWidget {
  ControlScreen({super.key});

  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  double velocity = 0.0;
  VelocityController myVelocityController = VelocityController(0.0);

  void _handleDirectionSelected(String direction) {
    _sendMessageToRaspberry(direction);
    print('Direction selected: $direction');
  }

  void _handleSpeedSelected(String speed) {
    _sendMessageToRaspberry(speed);
    print('Speed selected: $speed');
    velocity = double.parse(speed);
    myVelocityController.updateVelocity(velocity);
  }

  void _sendMessageToRaspberry(String message) async {
    try {
      Socket socket = await Socket.connect('192.168.1.126', 8000);
      socket.write(message);
      socket.close();
    } catch (e) {
      print(e);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error connecting to the server: $e'),
        ),
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
                velocityController: myVelocityController,
                buttonSize: 130,
              ),
              VelocityControl(
                onSpeedSelected: _handleSpeedSelected,
                sliderHeight: 40,
                velocityController: myVelocityController,
              ),
              // Add other controls here if needed
            ],
          ),
        ),
      ),
    );
  }
}