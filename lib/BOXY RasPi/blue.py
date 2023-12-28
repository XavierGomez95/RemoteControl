import bluetooth

# Configura el servidor Bluetooth
server_socket = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
port = 1  # Puedes seleccionar cualquier puerto disponible

# Enlaza al puerto
server_socket.bind(("", port))

# Comienza a escuchar conexiones
server_socket.listen(1)
print(f"Listening on RFCOMM channel {port}")

try:
    while True:  # Bucle principal para aceptar conexiones
        print("Waiting for a connection...")
        client_socket, client_info = server_socket.accept()
        print(f"Got a connection from {client_info}")

        try:
            # Bucle para recibir datos del cliente
            while True:
                data = client_socket.recv(1024)
                if not data:
                    break
                # Decodifica la data y haz algo con ella
                message = data.decode('utf-8')
                print(f"Received message: {message}")
                if message == "exit":
                    print("Exit signal received, closing connection.")
                    break
                # Aquí podrías agregar lógica para manejar los comandos
        finally:
            # Limpieza de la conexión con el cliente
            client_socket.close()
            print("Connection closed")

except KeyboardInterrupt:
    print("Server is shutting down.")
finally:
    # Limpieza del servidor
    server_socket.close()
    print("Server closed")
