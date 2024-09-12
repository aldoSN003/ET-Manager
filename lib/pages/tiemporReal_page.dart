import 'package:electric_tile_demo/utils/constants/svg_icons.dart';
import 'package:electric_tile_demo/utils/widgets/CardCarouselMainContent.dart';
import 'package:electric_tile_demo/utils/widgets/CarouselMainContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TiemporealPage extends StatelessWidget {
  const TiemporealPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      const CardCarouselMainContent(
          asset: "assets/svg/historial/energiaHistorial.svg"),
      const CardCarouselMainContent(
        asset: "assets/svg/historial/voltajeHistorial.svg",
      ),
      const CardCarouselMainContent(
        asset: "assets/svg/historial/amperajeHistorial.svg",
      ),
    ];
    return CarouselMainContent(items: items);
  }
}
