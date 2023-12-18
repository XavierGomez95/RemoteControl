import socket

# Configura el servidor de socket
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = socket.gethostname()  # Obtén la dirección local de la máquina
print(host)
port = 12345                 # Selecciona un puerto para tu servicio

# Enlaza al host y al puerto
server_socket.bind((host, port))

# Comienza a escuchar conexiones
server_socket.listen(5)
print(f"Listening on {host}:{port}")

try:
    while True:  # Bucle principal para aceptar conexiones
        print("Waiting for a connection...")
        client_socket, addr = server_socket.accept()
        print(f"Got a connection from {addr}")

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

