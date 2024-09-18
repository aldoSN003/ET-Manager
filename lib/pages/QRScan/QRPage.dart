import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:electric_tile_demo/MQTT/MQTTAppState.dart';
import 'package:electric_tile_demo/MQTT/MQTTManager.dart';
import 'package:electric_tile_demo/utils/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/foundation.dart';

late final String broker;
late final String topic;

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  late MQTTAppState currentAppState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lector QR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          if (result != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                style: TextStyle(fontSize: 12),
                'Código escaneado: ${result!.code}',
              ),
            ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Agrega un nuevo dispositivo a ET Manager",
                  style: iTextStyles().subHeading1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;

        // Process the scanned data (assuming JSON format)
        try {
          final jsonData = jsonDecode(result!.code!);
          broker = jsonData['broker'];
          topic = jsonData['topic'];

          print(broker);
          print(topic);

          // Update your MQTTManager with the new broker and topic

          MQTTManager mqttManager = MQTTManager(
            host: broker,
            topic: topic,
            identifier: 'ETManagerClient', // Replace with a suitable identifier
            state: currentAppState,
          );
          mqttManager.initializeMQTTClient();
          mqttManager.connect();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Conexion establecida a ${broker} en el topic ${topic}")));
          // Optionally, you can add a snackbar or other UI feedback here to indicate connection status
        } catch (e) {
          // Handle invalid QR code data

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Invalid QR code. Unable to connect to ${broker} en el topic ${topic}')),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
