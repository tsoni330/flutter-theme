import 'package:flutter/material.dart';


class ThemeManager{
  String? color;
  bool? isDark;

  static ThemeData getThemeData(String color, bool isDark){

      switch(color){
        case "Green":
          return ThemeData(
            colorSchemeSeed: Colors.greenAccent,
            brightness: isDark?Brightness.dark:Brightness.light,
            useMaterial3: true,
          );
        case "Yellow":
          return ThemeData(
            colorSchemeSeed: Colors.yellow,
            brightness: isDark?Brightness.dark:Brightness.light,
            useMaterial3: true,
          );
        case "Brown":
          return ThemeData(
            colorSchemeSeed: Colors.brown,
            brightness: isDark?Brightness.dark:Brightness.light,
            useMaterial3: true,
          );

      }
    return ThemeData();
  }

}