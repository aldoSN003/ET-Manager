import 'package:electric_tile_demo/pages/StatusPage.dart';
import 'package:electric_tile_demo/pages/dispositivos_page.dart';
import 'package:electric_tile_demo/pages/historial_page.dart';
import 'package:electric_tile_demo/pages/tiemporReal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class iCustomNavBar extends StatelessWidget {
  const iCustomNavBar({
    super.key,
  });

  static NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
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
        destinations: [
          NavigationDestination(
              icon: SvgPicture.asset("assets/navBarIcons/trIcon.svg"),
              label: "Tiempo Real"),
          NavigationDestination(
              icon: SvgPicture.asset("assets/navBarIcons/hIcon.svg"),
              label: "Historial"),
          NavigationDestination(
              icon: SvgPicture.asset("assets/navBarIcons/dIcon.svg"),
              label: "Dispositivos"),
          NavigationDestination(
              icon: SvgPicture.asset("assets/navBarIcons/sIcon.svg"),
              label: "Status"),
        ],
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
