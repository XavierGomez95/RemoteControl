import 'package:flutter/material.dart';
import 'control_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Índice para la navegación

  // Lista de widgets que deseas mostrar en cada pantalla
  final List<Widget> _widgetOptions = [
    SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10),  // Espacio en la parte superior.
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Utiliza esta aplicación para manejar el robot BOXY, '
                  'equipado con una base Raspberry Pi. '
                  'Controla el movimiento, dirección y otras características '
                  'específicas directamente desde tu dispositivo.',
              textAlign: TextAlign.center,
            ),
          ),
          Image.asset('assets/images/robot1.png'),  // Tu imagen del robot.
          const ListTile(
            leading: Icon(Icons.control_camera, size: 36),
            title: Text('Control de Dirección'),
            subtitle: Text('Maneja el robot hacia adelante, atrás y gira a los lados.'),
          ),
          const ListTile(
            leading: Icon(Icons.speed, size: 36),
            title: Text('Velocidad y Movimiento'),
            subtitle: Text('Ajusta la velocidad de BOXY y monitorea su desplazamiento.'),
          ),
          const ListTile(
            leading: Icon(Icons.thermostat_outlined, size: 36),
            title: Text('Lecturas de Sensores'),
            subtitle: Text('Obtén información en tiempo real sobre la temperatura y otros sensores.'),
          ),
          const SizedBox(height: 20),  // Espacio adicional en la parte inferior.
        ],
      ),
    ),
    ControlScreen(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BOXY Autonomous robot'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // Muestra el widget seleccionado
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting, // Este es el tipo que proporciona el efecto de "splash"
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green, // Color de fondo para el elemento seleccionado
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.control_camera),
            label: 'Control',
            backgroundColor: Colors.green, // Color de fondo para el elemento seleccionado
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white, // Color del ícono/texto cuando está seleccionado
        unselectedItemColor: Colors.blueGrey, // Color del ícono/texto cuando no está seleccionado
        onTap: _onItemTapped,
        showUnselectedLabels: false, // Esto puede ayudar a hacer el efecto más claro
      ),
    );
  }

}
