import 'package:flutter/material.dart';

class CostumeTheme {
  static Color grey = const Color(0xffDFDFDF);
  static Color yellow = const Color(0xffFFDB47);

  static ThemeData getTheme() {
    Map<String, double> fontsize = {
      "sm": 14,
      "md": 18,
      "lg": 24,
    };

    return ThemeData(
        primaryColor: yellow,
        fontFamily: 'DMSans',
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            toolbarHeight: 70,
            centerTitle: true,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'DMSans',
                fontSize: fontsize["lg"],
                fontWeight: FontWeight.bold)),
        tabBarTheme: TabBarTheme(
          labelColor: yellow,
          unselectedLabelColor: Colors.black,
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              color: Colors.black,
              fontSize: fontsize["lg"],
              fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              color: Colors.black,
              fontSize: fontsize["md"],
              fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(
              color: Colors.black,
              fontSize: fontsize["sm"],
              fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
              fontSize: fontsize['sm'], fontWeight: FontWeight.normal),
          titleSmall: TextStyle(
              fontSize: fontsize['sm'],
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ));
  }
}
