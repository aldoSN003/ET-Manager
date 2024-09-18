import 'package:electric_tile_demo/pages/RealTimeData/RealTimeCard.dart';
import 'package:electric_tile_demo/pages/RealTimeData/RealTimeChart.dart';
import 'package:electric_tile_demo/utils/widgets/CardCarouselMainContent.dart';
import 'package:electric_tile_demo/utils/widgets/CarouselMainContent.dart';
import 'package:flutter/material.dart';

class BateriaPage extends StatelessWidget {
  const BateriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      const CardCarouselMainContent(
        asset: "assets/status/CiclosCargaGraph.svg",
      ),
      const CardCarouselMainContent(
        asset: "assets/status/Cargando.svg",
      ),
      const CardCarouselMainContent(
        asset: "assets/status/Internet.svg",
      ),
      RealTimeCard(),
      RealTimeChart()
    ];
    return CarouselMainContent(items: items);
  }
}
