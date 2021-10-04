//Util Methods

import 'package:flutter/material.dart';

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

bool isMobileView(BuildContext context) {
  return getWidth(context) < 700 || getHeight(context) > getWidth(context);
}

///Changing range eg : (0 - 1000) -> (300 - 700) ie., -600! In terms of width
double getCursorMainScreenWithRangeW(double da, BuildContext context) {
  return (((da) * (getWidth(context) - 600)) / (getWidth(context)));
}

///same as above but for Height
double getCursorMainScreenWithRangeH(double da, BuildContext context) {
  return (((da) * (getHeight(context) - 600)) / (getHeight(context)));
}
