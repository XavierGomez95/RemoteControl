import 'package:remotecontrol/models/Position.dart';
import '../models/robot.dart';

class RobotService {
  final Robot robot = Robot(position: Position(latitude: 0.0, longitude: 0.0));

  void updateTemperature(double newTemp) {
    robot.temperature = newTemp;
    print('Temperatura actualizada a: $newTemp');
    // Aquí agregarías la lógica para comunicarte con el hardware del robot.
  }

  void updateDistance(double newDistance) {
    robot.distance = newDistance;
    print('Distancia actualizada a: $newDistance');
    // Similarmente, implementar la comunicación con el robot.
  }

  void updatePacketColor(String newColor) {
    robot.packetColor = newColor;
    print('Color del paquete actualizado a: $newColor');
    // Actualizar el color del paquete en el robot.
  }

  void updateLightOn(bool isLightOn) {
    robot.lightOn = isLightOn;
    print('Luz encendida: $isLightOn');
    // Encender o apagar la luz en el robot.
  }

  void updateVelocity(double newVelocity) {
    if (newVelocity >= 0) {
      robot.velocity = newVelocity;
      print('Velocidad actualizada a: $newVelocity');
      // Actualizar la velocidad del robot.
    } else {
      print('La velocidad no puede ser negativa.');
    }
  }

// ... cualquier otro método que necesites.
}
