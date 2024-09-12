import 'package:electric_tile_demo/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isDarkMode = false; // Estado inicial del toggle

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Encabezado con CircleAvatar, nombre y correo electrónico
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: iColors.myblue),
            accountName: Text('José Aldo'),
            accountEmail: Text('j.aldo@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: Text(
                'JA', // Inicial del usuario
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          // Cuerpo con 5 tiles
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Inicio'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Perfil'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notificaciones'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Ajustes'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('Acerca de'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          // Footer con toggle button para cambiar el tema
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode,
                    color: isDarkMode ? Colors.grey : Colors.yellow),
                Switch(
                  value: isDarkMode,
                  activeColor: Colors.black, // Color para modo oscuro
                  inactiveThumbColor: Colors.yellow, // Color para modo claro
                  inactiveTrackColor: Colors.yellow[200],
                  onChanged: (bool value) {
                    setState(() {
                      isDarkMode = value; // Actualizar el estado del toggle
                    });
                    // Aquí iría la funcionalidad para cambiar el modo oscuro/claro
                  },
                ),
                Icon(Icons.dark_mode,
                    color: isDarkMode ? Colors.white : Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
