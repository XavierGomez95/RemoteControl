import 'package:flutter/material.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementar UI basada en la Pantalla 3 del diseño
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control Robot'),
      ),
      body: const Center(
        child: Text('Control Screen Placeholder'),
      ),
    );
  }
}
