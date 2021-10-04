import 'dart:async';

import 'package:ankitsagar/UI/pages/home/home.dart';
import 'package:ankitsagar/UI/widgets/desktop/circleImage.dart';
import 'package:ankitsagar/UI/widgets/mobile/circleImage.dart';
import 'package:ankitsagar/UI/widgets/responsiveWidget.dart';
import 'package:ankitsagar/config/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  initState(context) {
    Timer(const Duration(milliseconds: 3000), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    initState(context);
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          desktopScreen: MainCirclePhoto(
            verticalPadding: 140,
            logoTextStyleHeight: 60,
          ),
          tabletScreen: MainCirclePhoto(
            verticalPadding: 180,
            logoTextStyleHeight: 54,
          ),
          mobileScreen: MainCirclePhotoMobile(
            verticalPadding: 200,
          ),
        ),
      ),
    );
  }
}
