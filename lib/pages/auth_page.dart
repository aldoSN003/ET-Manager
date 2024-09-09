import 'package:auto_size_text/auto_size_text.dart';
import 'package:electric_tile_demo/pages/home_page.dart';
import 'package:electric_tile_demo/utils/widgets/button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset:
              true, // Automatically adjust bottom padding when keyboard is visible

          body: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 5, left: 15, right: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                _header(),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Add functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity,
                              50), // Full width and fixed height
                        ),
                        child: const Text('Registro con Google'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity,
                              50), // Full width and fixed height
                        ),
                        child: const Text('Registro con Apple'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity,
                              50), // Full width and fixed height
                        ),
                        child: const Text('Registro con Facebook'),
                      ),
                    ],
                  ),
                  height: MediaQuery.sizeOf(context).height * 0.3,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Divider(),
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Add functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          minimumSize: Size(double.infinity,
                              50), // Full width and fixed height
                        ),
                        child: const Text('Crear una cuenta'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("¿Ya tienes una cuenta?"),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => HomePage());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          minimumSize: Size(double.infinity,
                              50), // Full width and fixed height
                        ),
                        child: const Text('Inicia Sesion'),
                      ),
                    ],
                  ),
                  height: MediaQuery.sizeOf(context).height * 0.25,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                      "Al registrarte, aceptas los Términos de Servicio y la Política de Privacidad, incluido el Uso de Cookies."),
                  height: MediaQuery.sizeOf(context).height * 0.06,
                ),
              ],
            ),
          )),
    );
  }
}

class _header extends StatelessWidget {
  const _header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Explora",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
              ),
              AutoSizeText("Únete a ET Manager",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24)),
            ],
          ),
        ],
      ),
      height: MediaQuery.sizeOf(context).height * 0.12,
    );
  }
}
