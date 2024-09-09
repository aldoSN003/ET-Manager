import 'package:electric_tile_demo/pages/StatusPage.dart';
import 'package:electric_tile_demo/pages/dispositivos_page.dart';
import 'package:electric_tile_demo/pages/historial_page.dart';
import 'package:electric_tile_demo/pages/tiemporReal_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
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
                    backgroundImage: AssetImage("assets/DogAvatar.png"),
                  ),
                ],
              ),
            )
          ],
          forceMaterialTransparency: false,
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.22,
          foregroundColor: Colors.yellow,
          backgroundColor: const Color.fromARGB(255, 20, 33, 61),
          shadowColor: Colors.grey,
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Dispositivo actual: ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Pasillo ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )),
        ),
        drawer: SafeArea(child: const Drawer()),
        bottomNavigationBar: Obx(
          () => NavigationBar(
            backgroundColor: Colors.white,
            indicatorColor: Colors.amber[50],
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
              print(index);
            },
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.history), label: "Historial"),
              NavigationDestination(
                  icon: Icon(Icons.timeline_outlined), label: "Tiempo Real"),
              NavigationDestination(
                  icon: Icon(Icons.account_tree_rounded),
                  label: "Dispositivos"),
              NavigationDestination(
                  icon: Icon(Icons.network_cell), label: "Status"),
            ],
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HistorialPage(),
    const TiemporealPage(),
    const DispositivosPage(),
    const BateriaPage()
  ];
}
