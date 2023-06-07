import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    primaryColor: const Color.fromRGBO(254, 254, 255, 1),
    useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromRGBO(254, 254, 255, 1),
    appBarTheme: appBarTheme(),
    iconButtonTheme: iconButtonTheme(),
    iconTheme: iconThemeData(),
    textTheme: textTheme(),
    listTileTheme: listTileThemeData(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    backgroundColor: Color.fromRGBO(254, 254, 255, 1),
  );
}

IconThemeData iconThemeData() {
  return const IconThemeData(size: 15);
}

ListTileThemeData listTileThemeData() {
  return const ListTileThemeData(
    titleTextStyle: TextStyle(
        color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
    subtitleTextStyle: TextStyle(
        color: Color.fromRGBO(59, 59, 59, 1),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    titleSmall: TextStyle(color: Color.fromRGBO(254, 254, 255, 1)),
    titleMedium: TextStyle(
        color: Color.fromRGBO(254, 254, 255, 1),
        fontWeight: FontWeight.bold,
        letterSpacing: 2),
    headlineLarge: TextStyle(
        color: Color.fromRGBO(9, 5, 28, 1),
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal),
    displaySmall: TextStyle(
        color: Color.fromRGBO(59, 59, 59, 1),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal),
    labelMedium: TextStyle(
      color: Color.fromRGBO(21, 190, 119, 1),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 20,
    ),
  );
}

IconButtonThemeData iconButtonTheme() {
  return const IconButtonThemeData(
    style: ButtonStyle(
      iconSize: MaterialStatePropertyAll(30),
      minimumSize: MaterialStatePropertyAll(Size(15, 15)),
      iconColor: MaterialStatePropertyAll(
        Color.fromRGBO(218, 99, 23, 1),
      ),
      backgroundColor: MaterialStatePropertyAll(
        Color.fromRGBO(249, 168, 77, 1),
      ),
    ),
  );
}
