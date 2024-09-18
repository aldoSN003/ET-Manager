import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselMainContent extends StatelessWidget {
  const CarouselMainContent({
    super.key,
    required this.items,
  });

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlayInterval: const Duration(milliseconds: 1700),
        height: MediaQuery.sizeOf(context).height,
        scrollDirection: Axis.vertical,
        enlargeCenterPage: true,
        //  autoPlay: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        viewportFraction: 0.9,
      ),
      items: items,
    );
  }
}
