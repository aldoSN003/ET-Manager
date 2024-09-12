import 'package:auto_size_text/auto_size_text.dart';
import 'package:electric_tile_demo/utils/constants/text_styles.dart';
import 'package:flutter/material.dart';

class Welcomecarouseltext extends StatelessWidget {
  const Welcomecarouseltext(
      {super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Center(
                    child: AutoSizeText(
                      title,
                      style: iTextStyles().heading1,
                    ),
                  ),
                )),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: AutoSizeText(
                    textAlign: TextAlign.center,
                    content,
                    style: iTextStyles(
                            foreGroundColor:
                                const Color.fromARGB(255, 97, 97, 97))
                        .text,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
