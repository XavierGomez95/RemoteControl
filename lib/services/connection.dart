import 'dart:async';
import 'dart:io';

class Connection {
  Socket? _socket;

  Future<void> connect(String address, int port) async {
    // Implementa la lógica de conexión aquí
    _socket = await Socket.connect(address, port);
  }

  void send(String message) {
    // Envía mensajes al robot
    _socket?.write(message);
  }

  void dispose() {
    // Cierra la conexión
    _socket?.close();
  }
}
