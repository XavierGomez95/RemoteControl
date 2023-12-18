import 'package:remotecontrol/models/Position.dart';

class Robot {
  double temperature;
  double distance;
  int rotations;
  double _velocity;  // Campo privado para la velocidad
  bool _lightOn;     // Campo privado para el estado de la luz
  String _packetColor;  // Campo privado para el color del paquete
  Position position;

  Robot({
    this.temperature = 0.0,
    this.distance = 0.0,
    this.rotations = 0,
    required this.position,
    double velocity = 0.0,
    bool lightOn = false,
    String packetColor = 'default',
  }) : _velocity = velocity,
        _lightOn = lightOn,
        _packetColor = packetColor;

  set velocity(double velocity) => _velocity = velocity;
  set lightOn(bool lightOn) => _lightOn = lightOn;
  set packetColor(String packetColor) => _packetColor = packetColor;

  // Si necesitas obtener estos valores, puedes definir getters:
  double get velocity => _velocity;
  bool get lightOn => _lightOn;
  String get packetColor => _packetColor;
}
