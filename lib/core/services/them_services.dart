import 'package:movies_app/core/them/manager_light_them.dart';
import 'package:flutter/material.dart';

class ThemServices {
  ThemeMode getThemMode() => ThemeMode.dark;
  ThemeData getThemeData() => managerLightThemData();
}
