import 'dart:async';

import 'package:flutter/material.dart';
import 'package:remotecontrol/velocity_controller.dart';
import 'package:remotecontrol/widgets/directionButton.dart';

final GlobalKey<_DirectionControlState> directionControlKey = GlobalKey();

class DirectionControl extends StatefulWidget {
  final Function(String direction) onDirectionSelected;
  final double buttonSize;
  final VelocityController velocityController;

  DirectionControl({
    super.key,
    required this.onDirectionSelected,
    this.buttonSize = 60.0,
    required this.velocityController, // Tamaño de los botones
  });

  @override
  State<DirectionControl> createState() => _DirectionControlState();
}

class _DirectionControlState extends State<DirectionControl> {
  final Stopwatch _stopwatch = Stopwatch()..start();
  double _ultimaActualizacion = 0.0;
  double _distanciaMetros = 0.0;

  double get velocity => widget.velocityController.value;

  // Método para calcular la distancia en metros
  double calcularDistanciaEnMetros(double tiempoTranscurrido) {
    // La relación es 21.5 cm por cada RPM
    const relacionCmPorRPM = 21.5;
    return (velocity * relacionCmPorRPM * tiempoTranscurrido) / (100 * 60); // Convertir de cm a metros
  }

  void _actualizarDistancia() {
    double tiempoTranscurrido = _stopwatch.elapsed.inSeconds.toDouble();
    setState(() {
      _distanciaMetros += calcularDistanciaEnMetros(tiempoTranscurrido - _ultimaActualizacion);
      _ultimaActualizacion = tiempoTranscurrido;
    });
  }

  @override
  void initState() {
    super.initState();
    // Configura un temporizador para actualizar la distancia cada segundo
    Timer.periodic(const Duration(seconds: 1), (_) {
      _actualizarDistancia();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.velocityController.value);
    // Estilo para los botones
    final buttonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blueGrey[600], // Color del ícono
      elevation: 4, // Sombra del botón (una sombra más sutil)
      shape: CircleBorder(), // Esto creará un borde circular para el botón
      padding: EdgeInsets.all(20), // Añade un poco de padding si quieres que los botones sean más grandes
    );


    return ValueListenableBuilder<double>(
      valueListenable: widget.velocityController,
      builder: (context, velocity, _) {

        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Resto del código...
              Card(
                child: ListTile(
                  leading: Icon(Icons.sync_rounded, color: Colors.green),
                  title: const Text('Rotations'),
                  subtitle: Text('${velocity.toStringAsFixed(0)} RMP'),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                child: ListTile(
                  leading: Icon(Icons.linear_scale, color: Colors.red),
                  title: const Text('Distance'),
                  subtitle: Text('${_distanciaMetros.toStringAsFixed(3)} meters'),
                ),
              ),
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DirectionButton(
                    icon: Icons.arrow_back,
                    onPressed: () => widget.onDirectionSelected('left'),
                    size: widget.buttonSize,
                    style: buttonStyle,
                  ),
                  SizedBox(width: widget.buttonSize), // Espacio para el botón central
                  DirectionButton(
                    icon: Icons.arrow_forward,
                    onPressed: () => widget.onDirectionSelected('right'),
                    size: widget.buttonSize,
                    style: buttonStyle,
                  ),
                ],
              ),
              // Resto del código...
            ],
          ),
        );
      },
    );
  }
}

