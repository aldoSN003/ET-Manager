import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:electric_tile_demo/pages/home_page.dart';
import 'package:electric_tile_demo/pages/signIn_page.dart';
import 'package:electric_tile_demo/utils/constants/colors.dart';
import 'package:electric_tile_demo/utils/constants/text_styles.dart';
import 'package:electric_tile_demo/utils/widgets/WelcomeCarouselText.dart';
import 'package:electric_tile_demo/utils/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class WelcomePageCopy extends StatefulWidget {
  const WelcomePageCopy({super.key});

  @override
  State<WelcomePageCopy> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePageCopy> {
  static const String assetName = 'assets/svg/ETMainLogo.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 33, 61),
        body: _welcomeUI());
  }

  Widget _welcomeUI() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "ET Manager",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                  begin: 50,
                  end: MediaQuery.sizeOf(context).width *
                      0.85), // Adjust the size range as needed
              duration: const Duration(milliseconds: 1500),
              curve: Curves
                  .easeInOut, // Optional: Add easing for smoother animation
              builder: (context, size, _) {
                return SizedBox(
                  width: size,
                  height: size,
                  child: SvgPicture.asset(
                    assetName,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      WelcomeFooterContainer(context: context),
    ]);
  }
}

class WelcomeFooterContainer extends StatelessWidget {
  const WelcomeFooterContainer({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext thecontext) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.34,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(thecontext).height * 0.22,
                child: TextCarousel(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(thecontext).width) *
                    0.1,
                child: MyButton(
                    label: "Comienza",
                    backgroundColor: iColors.primary,
                    foregroundcolor: Colors.white,
                    onPressed: () => Get.to(() => SigninPage())),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextCarousel extends StatelessWidget {
  const TextCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider(
        items: const [
          Welcomecarouseltext(
            content:
                "Con ET Manager serás capaz de monitorear tus baldosas en tiempo real y verificar que todas funcionen correctamente.",
            title: "Monitoreo en tiempo real",
          ),
          Welcomecarouseltext(
              title: "Múltiples dispositivos",
              content:
                  "Podrás agregar diferentes grupos de baldosas de acuerdo a tus necesidades y administrarlos, todo en una sola aplicación."),
          Welcomecarouseltext(
              title: "Historial",
              content:
                  "Podrás consultar cómo se han comportado tus baldosas a lo largo del tiempo y obtener las gráficas en un archivo PDF.")
        ],
        options: CarouselOptions(
          height: MediaQuery.sizeOf(context).height * 0.5, // Ajusta la altura
          scrollDirection: Axis.horizontal,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          viewportFraction: 0.9,
          autoPlayInterval: const Duration(milliseconds: 2000),
          autoPlay: true,
        ),
      ),
    );
  }
}
