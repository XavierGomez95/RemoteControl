import 'package:flutter_blue/flutter_blue.dart';
import 'dart:convert'; // Para utf8.encode

class BluetoothConnection {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice? targetDevice;
  BluetoothCharacteristic? targetCharacteristic;

  Future<void> connectToDevice(String deviceName) async {
    try {
      // Comienza el escaneo
      flutterBlue.startScan(timeout: const Duration(seconds: 15));

      // Escucha los resultados del escaneo
      await for (var scanResult in flutterBlue.scanResults) {
        for (ScanResult result in scanResult) {
          if (result.device.name == deviceName) {
            targetDevice = result.device;
            break;
          }
        }
      }

      // Detén el escaneo
      flutterBlue.stopScan();

      // Si encontramos el dispositivo, intentamos conectar
      if (targetDevice != null) {
        await targetDevice!.connect();
        print("Connected to $deviceName");

        // Descubre los servicios y características
        List<BluetoothService> services = await targetDevice!.discoverServices();
        for (var service in services) {
          // Encuentra la característica correcta (deberás conocer su UUID)
          for (var characteristic in service.characteristics) {
            if (characteristic.uuid.toString() == "tu-uuid-de-característica") {
              targetCharacteristic = characteristic;
              break;
            }
          }
        }
      }
    } catch (e) {
      print('Error al conectarse al dispositivo: $e');
    }
  }

  Future<void> send(String message) async {
    if (targetCharacteristic != null) {
      await targetCharacteristic!.write(utf8.encode(message));
      print('Mensaje enviado: $message');
    }
  }

  Future<void> disconnect() async {
    if (targetDevice != null) {
      await targetDevice!.disconnect();
      print('Dispositivo desconectado.');
    }
  }
}
