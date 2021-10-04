import 'package:flutter/material.dart';

import 'UI/pages/splashscreen/splashScreen.dart';

void main() => runApp(AnkitSagar());

class AnkitSagar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ankit Sagar --Portfolio",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
