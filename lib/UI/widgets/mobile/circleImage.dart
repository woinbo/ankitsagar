import 'package:ankitsagar/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainCirclePhotoMobile extends StatelessWidget {
  const MainCirclePhotoMobile({
    Key key,
    @required this.verticalPadding,
  }) : super(key: key);

  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context),
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            flex: 5,
            child: Hero(
              tag: "logoNameStylee",
              child: SvgPicture.asset(
                "assets/svgs/ankitSagarFontStyle.svg",
                // height: logoTextStyleHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
