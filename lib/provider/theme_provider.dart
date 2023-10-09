import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_app/theme/themes.dart';

class ThemeProvider extends ChangeNotifier{
  bool? isDark=false;
  String? color = "Brown";
  late SharedPreferences sharedPreferences;
  static ThemeData themeData = ThemeData(
    colorSchemeSeed: Colors.brown,
    brightness: Brightness.light,
    useMaterial3: true
  );
  ThemeProvider(){
    getStoredTheme();
  }
  getStoredTheme() async{
    print("Its work");
    sharedPreferences = await SharedPreferences.getInstance();
    isDark= sharedPreferences.getBool("theme");
    color = sharedPreferences.getString("color");
    isDark ??= false;
    color ??= "Brown";
    themeData = ThemeManager.getThemeData(color!,isDark!);
    notifyListeners();
  }
  void switchTheme(bool value,String color) async{
    print("Value "+value.toString()+" color "+color);
    sharedPreferences = await SharedPreferences.getInstance();
    isDark = value;
    color = color;
    sharedPreferences.setBool("theme", value);
    sharedPreferences.setString("color", color);
    themeData = ThemeManager.getThemeData(color!,isDark!);
    print('The theme data is '+themeData.toString());
    notifyListeners();
  }

}

