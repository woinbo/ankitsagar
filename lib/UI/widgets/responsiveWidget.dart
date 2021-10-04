import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget desktopScreen;
  final Widget tabletScreen;
  final Widget mobileScreen;

  const ResponsiveWidget({
    Key key,
    @required this.desktopScreen,
    this.tabletScreen,
    this.mobileScreen,
  }) : super(key: key);

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 400;
  }

  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  static bool isTabletScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 400 &&
        MediaQuery.of(context).size.width < 800;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return desktopScreen;
        } else if (constraints.maxWidth >= 400 && constraints.maxWidth <= 800) {
          return tabletScreen ?? desktopScreen;
        } else {
          return mobileScreen ?? desktopScreen;
        }
      },
    );
  }
}
