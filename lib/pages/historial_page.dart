import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:electric_tile_demo/utils/constants/text_styles.dart';
import 'package:electric_tile_demo/utils/widgets/button.dart';
import 'package:electric_tile_demo/utils/widgets/shapes/bezier_clipper1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HistorialPage extends StatelessWidget {
  const HistorialPage({super.key});

  static const String assetName = 'assets/svg/CircleAvatar.svg';

  @override
  Widget build(BuildContext context) {
    List<Widget> content = [
      CardPdfContent(
        asset: "assets/svg/tiempoReal/energiaGenerada.svg",
      ),
      CardPdfContent(asset: "assets/svg/tiempoReal/voltaje.svg"),
      CardPdfContent(asset: "assets/svg/tiempoReal/amperaje.svg")
    ];
    var screenHeigt = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return CarouselSlider(
      options: CarouselOptions(
        autoPlayInterval: Duration(milliseconds: 1700),
        height: MediaQuery.sizeOf(context).height,
        scrollDirection: Axis.vertical,
        enlargeCenterPage: true,
        autoPlay: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        viewportFraction: 0.9,
      ),
      items: content,
    );
  }
}

class CardPdfContent extends StatelessWidget {
  const CardPdfContent({
    super.key,
    required this.asset,
  });
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Colors.white,
              child: SvgPicture.asset(
                asset,
              ),
            ),
            PrintPdfButton()
          ],
        ),
      ),
    );
  }
}

class PrintPdfButton extends StatelessWidget {
  const PrintPdfButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
      ),
      label: AutoSizeText(
        "Imprimir PDF",
        style: iTextStyles().subHeading1,
      ),
      onPressed: () {},
      icon: SvgPicture.asset(
        "assets/icons/pdfIcon.svg",
        height: 25,
      ),
    );
  }
}

/*
    
SingleChildScrollView(
      child: Column(
        children: [
          ClipPath(
            clipper: Icustomcurvedwidgets(),
            child: Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                height: 400,
                child: const Stack(
                  children: [
                    Positioned(
                      top: -150,
                      right: -250,
                      child: circularContainer(
                        backgroundColor: Color.fromARGB(170, 255, 248, 225),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      right: -300,
                      child: circularContainer(
                        backgroundColor: Color.fromARGB(170, 255, 248, 225),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
*/
