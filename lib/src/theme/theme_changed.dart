import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _curreuntTheme;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get curreuntTheme => this._curreuntTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _curreuntTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _curreuntTheme = ThemeData.dark();
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        _curreuntTheme = ThemeData.dark();
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _curreuntTheme = ThemeData.light();
        break;
    }
  }

  set darkTheme(bool val) {
    _darkTheme = val;
    _customTheme = false;
    if (val) {
      _curreuntTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
    } else {
      _curreuntTheme = ThemeData.light();
    }
    notifyListeners();
  }

  set customTheme(bool val) {
    _customTheme = val;
    _darkTheme = false;

    if (val) {
      _curreuntTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xff48a0eb),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202b),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
      );
    } else {
      _curreuntTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
