import 'package:auto_size_text/auto_size_text.dart';

import 'package:electric_tile_demo/utils/constants/text_styles.dart';
import 'package:electric_tile_demo/utils/widgets/CarouselMainContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DispositivosPage extends StatelessWidget {
  const DispositivosPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> content = [
      DevicesComponentCarousel(
        asset: "assets/THIS.jpg",
        title: "Mall",
      ),
      DevicesComponentCarousel(
        asset: "assets/Street.jpg",
        title: "Calle",
      ),
      DevicesComponentCarousel(
        asset: "assets/Hallway.jpg",
        title: "Pasillo",
      ),
    ];

    return CarouselMainContent(items: content);
  }
}

class DevicesComponentCarousel extends StatefulWidget {
  const DevicesComponentCarousel({
    super.key,
    required this.title,
    required this.asset,
  });

  final String title;
  final String asset;

  @override
  _DevicesComponentCarouselState createState() =>
      _DevicesComponentCarouselState();
}

class _DevicesComponentCarouselState extends State<DevicesComponentCarousel> {
  bool isConnected = false; // Estado inicial del dispositivo

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.6,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Dispositivo: ",
                        style: iTextStyles(foreGroundColor: Colors.grey)
                            .heading1, // Cambia según tu estilo
                      ),
                      AutoSizeText(
                        widget.title,
                        style: iTextStyles().heading1, // Cambia según tu estilo
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(widget.asset))),
                )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ToggleButton(
                      onToggle: (bool value) {
                        setState(() {
                          isConnected =
                              value; // Actualiza el estado del dispositivo
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        AutoSizeText(
                          widget.title,
                          style:
                              iTextStyles().smallText, // Cambia según tu estilo
                        ),
                        AutoSizeText(
                            isConnected
                                ? " se encuentra conectado"
                                : " se encuentra desconectado",
                            style: iTextStyles(
                                    foreGroundColor:
                                        isConnected ? Colors.green : Colors.red)
                                .smallText)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ToggleButton extends StatefulWidget {
  final ValueChanged<bool> onToggle;

  const ToggleButton({super.key, required this.onToggle});

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isOn = false; // Estado inicial

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.green, // Color cuando está activado (conectado)
      inactiveThumbColor:
          Colors.white, // Color cuando está desactivado (desconectado)
      inactiveTrackColor: Colors.red,
      value: isOn,
      onChanged: (bool value) {
        setState(() {
          isOn = value; // Actualiza el estado interno
          widget.onToggle(value); // Notifica al padre del cambio de estado
        });
      },
    );
  }
}

/*
Widget _toggleButton(){
   bool isDarkMode = false; // Estado inicial del toggle
  return Padding(
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
          );
}

*/