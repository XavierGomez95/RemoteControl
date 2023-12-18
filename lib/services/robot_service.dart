import '../models/robot.dart';
import 'connection.dart';
import 'package:remotecontrol/models/Position.dart';

class RobotService {


  final Robot robot = Robot(position: Position(latitude: 0.0, longitude: 0.0));


  final Connection connection = Connection();

  Future<void> initializeConnection() async {
    try {
      await connection.connect('127.0.0.1', 12345);
      print('Conexión establecida con el robot.');
    } catch (e) {
      print('Error al establecer la conexión: $e');
    }
  }

  void disconnect() {
    connection.dispose();
    print('Conexión cerrada.');
  }

  void sendCommand(String command) {
    connection.send(command);
    print('Comando enviado: $command');
  }

  void updateTemperature(double newTemp) {
    robot.temperature = newTemp;
    sendCommand('TEMPERATURE:$newTemp');
  }

  void updateDistance(double newDistance) {
    robot.distance = newDistance;
    sendCommand('DISTANCE:$newDistance');
  }

  void updatePacketColor(String newColor) {
    robot.packetColor = newColor;
    sendCommand('COLOR:$newColor');
  }

  void updateLightOn(bool isLightOn) {
    robot.lightOn = isLightOn;
    sendCommand('LIGHT:${isLightOn ? 'ON' : 'OFF'}');
  }

  void updateVelocity(double newVelocity) {
    if (newVelocity >= 0) {
      robot.velocity = newVelocity;
      sendCommand('VELOCITY:$newVelocity');
    } else {
      print('La velocidad no puede ser negativa.');
    }
  }

// Añade aquí más métodos para enviar otros comandos al robot
}
