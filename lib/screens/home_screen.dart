import 'package:flutter/material.dart';
import 'robot_details_screen.dart';
import 'control_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control RemoteR Home'),
      ),
      body: const Center(
        child: Text('Home Screen Placeholder'), // Reemplazar con el contenido real
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_remote),
            label: 'Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.control_camera),
            label: 'Control',
          ),
        ],
        // Implementar la lógica de navegación aquí
      ),
    );
  }
}
