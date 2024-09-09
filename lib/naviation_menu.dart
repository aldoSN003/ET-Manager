import 'package:flutter/material.dart';

class NaviationMenu extends StatelessWidget {
  const NaviationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(destinations: [
        Container(color: Colors.amber),
        Container(color: Colors.pink),
        Container(color: Colors.purple),
        Container(color: Colors.blue),
      ]),
    );
  }
}
