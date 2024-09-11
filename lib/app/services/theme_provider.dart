

import 'package:flutter/material.dart';
import 'package:swag_app_flutter/app/services/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {

  bool _isDark = false;
  bool get isDark => _isDark;

  changeTheme(){
    _isDark = !isDark;
    SharedPreferencesService().setIsDark(_isDark);
    notifyListeners();
  }

  init() async {
    _isDark = await SharedPreferencesService().getIsDark();
    notifyListeners();
  }
}