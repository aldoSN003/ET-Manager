import 'package:carousel_slider/carousel_slider.dart';
import 'package:electric_tile_demo/utils/widgets/CardCarouselMainContent.dart';
import 'package:electric_tile_demo/utils/widgets/CarouselMainContent.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DispositivosPage extends StatelessWidget {
  const DispositivosPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> content = [SvgPicture.asset("assets/disp/funciona.svg")];

    return CarouselMainContent(items: content);
  }
}
