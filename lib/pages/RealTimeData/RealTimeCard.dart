import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class RealTimeCard extends StatefulWidget {
  @override
  _RealTimeCardState createState() => _RealTimeCardState();
}

class _RealTimeCardState extends State<RealTimeCard> {
  double _simulatedData = 0.0; // Valor inicial de los datos
  late Timer _timer; // Temporizador para actualizar los datos

  @override
  void initState() {
    super.initState();
    _startSimulation();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancelamos el temporizador cuando se destruya el widget
    super.dispose();
  }

  // Función para simular datos en tiempo real
  void _startSimulation() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _simulatedData = _generateRandomData();
      });
    });
  }

  // Genera un valor aleatorio simulado entre 0 y 100
  double _generateRandomData() {
    final random = Random();
    return random.nextDouble() * 100; // Genera un número entre 0 y 100
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Datos en Tiempo Real',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Valor actual: ${_simulatedData.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: _simulatedData / 100, // Para mostrar el progreso del valor
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 10),
            Text(
              'Actualización cada segundo',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
