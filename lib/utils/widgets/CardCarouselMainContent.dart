import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardCarouselMainContent extends StatelessWidget {
  const CardCarouselMainContent(
      {super.key, required this.asset, this.myWidget, this.function});

  final String asset;
  final Widget? myWidget;
  final VoidCallbackAction? function;
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
            child: GestureDetector(
              onTap: () => function,
              child: SvgPicture.asset(
                height: MediaQuery.sizeOf(context).height * 0.5,
                asset,
              ),
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
