import 'package:remotecontrol/models/Position.dart';

class Robot {
  double temperature;
  double distance;
  // Añade las nuevas propiedades
  int rotations;
  Position position; // Asegúrate de tener una clase Position o usar un tipo adecuado

  Robot({
    this.temperature = 0.0,
    this.distance = 0.0,
    this.rotations = 0,
    required this.position, // Inicializa con un valor predeterminado si es necesario
  });

  set velocity(double velocity) {}

  set lightOn(bool lightOn) {}

  set packetColor(String packetColor) {}
}
