import '../models/robot.dart';

class RobotService {
  final Robot robot = Robot();

  void updateTemperature(double newTemp) {
    robot.temperature = newTemp;
    // Aquí agregarías la lógica para comunicarte con el hardware del robot.
  }

  void updateDistance(double newDistance) {
    robot.distance = newDistance;
    // Similarmente, implementar la comunicación con el robot.
  }

// Añade métodos para actualizar packetColor, lightOn, y velocity.
}
