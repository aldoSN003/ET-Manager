import 'package:electric_tile_demo/utils/widgets/CardCarouselMainContent.dart';
import 'package:electric_tile_demo/utils/widgets/CarouselMainContent.dart';
import 'package:flutter/material.dart';

class BateriaPage extends StatelessWidget {
  const BateriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      CardCarouselMainContent(
        asset: "assets/status/CiclosCargaGraph.svg",
      ),
      CardCarouselMainContent(
        asset: "assets/status/Cargando.svg",
      ),
      CardCarouselMainContent(
        asset: "assets/status/Internet.svg",
      )
    ];
    return CarouselMainContent(items: items);
  }
}
