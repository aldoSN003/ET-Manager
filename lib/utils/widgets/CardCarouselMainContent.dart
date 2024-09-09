import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardCarouselMainContent extends StatelessWidget {
  const CardCarouselMainContent(
      {super.key, required this.asset, this.myWidget});

  final String asset;
  final Widget? myWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
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
          Container(
            child: myWidget,
          )
        ],
      ),
    );
  }
}
