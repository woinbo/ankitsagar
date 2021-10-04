import 'package:ankitsagar/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainCirclePhoto extends StatelessWidget {
  const MainCirclePhoto(
      {Key key, @required this.verticalPadding, this.logoTextStyleHeight})
      : super(key: key);

  final double verticalPadding;
  final double logoTextStyleHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context),
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "designerCircle",
                child: Image.asset(
                  "assets/images/designerCircle.png",
                ),
              ),
              Hero(
                tag: "developerCircle",
                child: Image.asset(
                  "assets/images/developerCircle.png",
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: getWidth(context) / 2 - 125, //110
            child: Hero(
              tag: "logoNameStyle",
              child: SvgPicture.asset(
                "assets/svgs/ankitSagarFontStyle.svg",
                height: logoTextStyleHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
