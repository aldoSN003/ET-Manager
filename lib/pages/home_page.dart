import 'package:electric_tile_demo/pages/QRScan/QRPage.dart';
import 'package:electric_tile_demo/utils/constants/colors.dart';
import 'package:electric_tile_demo/utils/constants/svg_icons.dart';
import 'package:electric_tile_demo/utils/constants/text_styles.dart';
import 'package:electric_tile_demo/utils/widgets/MyDrawer.dart';
import 'package:electric_tile_demo/utils/widgets/customNavba.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static NavigationController controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    QRScannerPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, 1.0);
                  var end = Offset.zero;
                  var curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          },
          backgroundColor: iColors.myblue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu));
          }),
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 15, right: 15),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15, top: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Hello, welcome back",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "José Aldo",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    child: Text("JA"),
                  ),
                ],
              ),
            )
          ],
          flexibleSpace: Row(
            children: [
              Container(
                color: Colors.blue,
              ),
              Expanded(
                flex: 6,
                child: SizedBox(
                  height: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: "Dispositivo actual: ",
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(text: "Pasillo"),
                        ])),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          foregroundColor: iColors.primary,
          backgroundColor: iColors.myblue,
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.20,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ),
        ),
        drawer: MyDrawer(),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
        bottomNavigationBar: iCustomNavBar(),
      ),
    );
  }
}
