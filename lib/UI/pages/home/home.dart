import 'package:ankitsagar/UI/widgets/responsiveWidget.dart';
import 'package:ankitsagar/config/constants.dart';
import 'package:ankitsagar/utils/utils.dart';
import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController translateAnimController;
  Animation animScale;
  Animation animOpacity;
  Animation animTranslate;
  final globalKey = GlobalKey<ScaffoldState>();
  Offset pointer = Offset(300, 300);

  bool isLogoHovering = false;
  bool isDeveloperTextHovering = false;
  bool isDesignerTextHovering = false;
  bool isDeveloperHovering = false;
  bool isDesignerHovering = false;

  //Social Media Bools
  bool isLinkedInHovering = false;
  bool isGitHubHovering = false;
  bool isTwitterHovering = false;
  bool isInstagramHovering = false;
  bool isYouTubeHovering = false;
  bool isCodePenHovering = false;
  int mainItemHover = 0;
  @override
  void initState() {
    controller = AnimationController(
      lowerBound: 0.0,
      upperBound: 0.2,
      duration: Duration(milliseconds: 120),
      vsync: this,
    );
    translateAnimController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    animScale = CurveTween(
      curve: Interval(
        0.0,
        1.0,
        curve: Curves.easeOut,
      ),
    ).animate(controller);
    animOpacity = CurveTween(
      curve: Interval(
        0.0,
        0.8,
        curve: Curves.easeOut,
      ),
    ).animate(controller);
    animTranslate = CurveTween(
      curve: Interval(
        0.0,
        1.0,
        curve: Curves.easeOut,
      ),
    ).animate(translateAnimController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: kbackgroundColor,
      body: ResponsiveWidget(
        desktopScreen: MouseRegion(
          cursor: SystemMouseCursors.none,
          onHover: (eve) {
            setState(() {
              pointer = eve.position;
            });
          },
          child: AnimatedContainer(
            height: getHeight(context),
            width: getWidth(context),
            duration: Duration(milliseconds: 500),
            child: Stack(
              children: [
                AnimatedPositioned(
                  //Outer Ring
                  duration: Duration(milliseconds: 1500),
                  left: getCursorMainScreenWithRangeW(
                      pointer.dx - (getWidth(context) / 2), context),
                  top: getCursorMainScreenWithRangeH(
                          pointer.dy - (getWidth(context) / 2), context) -
                      getWidth(context) / 4,
                  child: Container(
                    height: getWidth(context),
                    width: getWidth(context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(getWidth(context) / 2)),
                        border: Border.all(
                            width: 2,
                            color: Colors.white,
                            style: BorderStyle.solid)),
                  ),
                ),
                AnimatedPositioned(
                  //Inner Ring
                  duration: Duration(milliseconds: 1000),
                  left: getCursorMainScreenWithRangeW(
                          pointer.dx - (getWidth(context) / 3), context) +
                      100,
                  top: getCursorMainScreenWithRangeH(
                          pointer.dy - (getWidth(context) / 3), context) -
                      getWidth(context) / 8,
                  child: Container(
                    height: 2 * getWidth(context) / 3,
                    width: 2 * getWidth(context) / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(getWidth(context) / 3)),
                        border: Border.all(
                            width: 2,
                            color: Colors.white,
                            style: BorderStyle.solid)),
                  ),
                ),
                AnimatedPositioned(
                    // Custom dot in Cursor
                    duration: const Duration(milliseconds: 100),
                    left: pointer.dx,
                    top: pointer.dy,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                    )),
                AnimatedPositioned(
                  // Cursor Ring
                  duration: Duration(milliseconds: 300),
                  left: pointer.dx - 100,
                  top: pointer.dy - 100,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        border: Border.all(
                            width: 4,
                            color: Colors.white,
                            style: BorderStyle.solid)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Hero(
                    tag: "developerCircle",
                    child: Transform.scale(
                      scale: isDeveloperHovering ? 1 + animScale.value : 1,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          onHover: (val) {
                            print(animScale.value);
                            setState(() {
                              controller.forward(from: 0.0);
                              translateAnimController.forward(from: 0.0);
                              isDeveloperHovering = val;
                            });
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/developerCircle.png",
                                height: 520,
                              ),
                              Positioned(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isDeveloperHovering
                                        ? const Color(0xff5F4CAC).withOpacity(
                                            animOpacity.value + 0.2)
                                        : Colors.transparent,
                                    borderRadius: const BorderRadius.only(
                                      topRight: const Radius.circular(1000),
                                      bottomRight: const Radius.circular(1000),
                                    ),
                                  ),
                                  height: 520,
                                  width: 520 / 2,
                                ),
                              ),
                              Positioned(
                                  child: AnimatedContainer(
                                duration: Duration(milliseconds: 1200),
                                child: Transform.translate(
                                  offset: Offset(
                                    isDeveloperHovering
                                        ? animTranslate.value * 60
                                        : -160,
                                    250,
                                  ),
                                  child: Text(
                                    "Developer;",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Quicksand",
                                      fontSize: 32,
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () {
                                        js.context.callMethod(
                                            "open", ["https://ankitsagar.me"]);
                                      },
                                      onHover: (val) {
                                        setState(() {
                                          controller.forward(from: 0.0);
                                          isLogoHovering = val;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/logo.png",
                                            scale: 2.5,
                                          ),
                                          SvgPicture.asset(
                                            "assets/svgs/ankitSagarFontStyle.svg",
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                              Row(
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () {},
                                      onHover: (val) {
                                        setState(() {
                                          isDeveloperTextHovering = val;
                                        });
                                      },
                                      child: AnimatedDefaultTextStyle(
                                        duration: Duration(milliseconds: 200),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "<Developer/>",
                                              style: TextStyle(
                                                color: Color(0xff402A9C),
                                              ),
                                            ),
                                            Text(
                                              "Coding builds, logical mind",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        style: TextStyle(
                                          // height: 1.4,
                                          fontFamily: "Quicksand",
                                          fontSize:
                                              isDeveloperTextHovering ? 40 : 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    width: 1,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Color(0xff5D4AAB),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xff7D6EBC),
                                          blurRadius: 12.0,
                                          spreadRadius: 0.5,
                                          offset: Offset(0.0,
                                              0.0), // shadow direction: bottom right
                                        )
                                      ],
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () {},
                                      onHover: (val) {
                                        setState(() {
                                          isDesignerTextHovering = val;
                                        });
                                      },
                                      child: AnimatedDefaultTextStyle(
                                        duration: Duration(milliseconds: 200),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "UX - Designer",
                                              style: TextStyle(
                                                color: Color(0xff402A9C),
                                              ),
                                            ),
                                            Text(
                                              "Desing makes attractive",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        style: TextStyle(
                                          height: 1.4,
                                          fontFamily: "Agustina",
                                          fontSize:
                                              isDesignerTextHovering ? 40 : 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 60),
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(bottom: 100, top: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onTap: () {},
                                        onHover: (val) {
                                          setState(() {
                                            isLinkedInHovering = val;
                                          });
                                        },
                                        child: Lottie.asset(
                                          'assets/lottie/linkedIn.json',
                                          height: 100,
                                          width: 100,
                                          repeat: true,
                                          reverse: true,
                                          animate: isLinkedInHovering,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onTap: () {},
                                        onHover: (val) {
                                          setState(() {
                                            isGitHubHovering = val;
                                          });
                                        },
                                        child: Lottie.asset(
                                          'assets/lottie/linkedIn.json',
                                          height: 100,
                                          width: 100,
                                          repeat: true,
                                          reverse: true,
                                          animate: isGitHubHovering,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onTap: () {},
                                        onHover: (val) {
                                          setState(() {
                                            isInstagramHovering = val;
                                          });
                                        },
                                        child: Lottie.asset(
                                          'assets/lottie/linkedIn.json',
                                          height: 100,
                                          width: 100,
                                          repeat: true,
                                          reverse: true,
                                          animate: isInstagramHovering,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onTap: () {},
                                        onHover: (val) {
                                          setState(() {
                                            isTwitterHovering = val;
                                          });
                                        },
                                        child: Lottie.asset(
                                          'assets/lottie/linkedIn.json',
                                          height: 100,
                                          width: 100,
                                          repeat: true,
                                          reverse: true,
                                          animate: isTwitterHovering,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onTap: () {},
                                        onHover: (val) {
                                          setState(() {
                                            isYouTubeHovering = val;
                                          });
                                        },
                                        child: Lottie.asset(
                                          'assets/lottie/linkedIn.json',
                                          height: 100,
                                          width: 100,
                                          repeat: true,
                                          reverse: true,
                                          animate: isYouTubeHovering,
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onTap: () {},
                                        onHover: (val) {
                                          setState(() {
                                            isCodePenHovering = val;
                                          });
                                        },
                                        child: Lottie.asset(
                                          'assets/lottie/linkedIn.json',
                                          height: 100,
                                          width: 100,
                                          repeat: true,
                                          reverse: true,
                                          animate: isCodePenHovering,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Hero(
                    tag: "designerCircle",
                    child: Transform.scale(
                      scale: isDesignerHovering ? 1 + animScale.value : 1,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          onHover: (val) {
                            setState(() {
                              controller.forward(from: 0.0);
                              translateAnimController.forward(from: 0.0);
                              isDesignerHovering = val;
                            });
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/designerCircle.png",
                                height: 520,
                              ),
                              Positioned(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isDesignerHovering
                                        ? const Color(0xff5F4CAC).withOpacity(
                                            animOpacity.value + 0.2)
                                        : Colors.transparent,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: const Radius.circular(1000),
                                      bottomLeft: const Radius.circular(1000),
                                    ),
                                  ),
                                  height: 520,
                                  width: 520 / 2,
                                ),
                              ),
                              Positioned(
                                  child: Transform.translate(
                                offset: Offset(
                                  isDesignerHovering
                                      ? -animTranslate.value * -18
                                      : 300,
                                  250,
                                ),
                                child: Text(
                                  "Designer",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Agustina",
                                    fontSize: 32,
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        mobileScreen: Container(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    translateAnimController.dispose();
    super.dispose();
  }
}
