import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier{

  SharedPreferences? sharedPreferences;
  ThemeMode?  theme = ThemeMode.dark;

  changeTheme(ThemeMode themeMode){
    theme = themeMode;
    notifyListeners();
    saveTheme(themeMode);
  }


  saveTheme(ThemeMode themeMode){
    String theme = themeMode == ThemeMode.dark ?"dark":"light";
    sharedPreferences?.setString('theme',theme);
  }

  Future<void> loadTheme()async{
    sharedPreferences =await SharedPreferences.getInstance();
    String? theme=sharedPreferences!.getString('theme');
    if(theme!=null){
      if(theme=="dark") {
        changeTheme(ThemeMode.dark);
      } else if(theme=="light"){
        changeTheme(ThemeMode.light);
      }
    }
  }
}