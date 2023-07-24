import 'package:movies_app/config/constant.dart';
import 'package:movies_app/core/resourses/manager_color.dart';
import 'package:movies_app/core/resourses/manager_size.dart';
import 'package:movies_app/core/resourses/manager_styles.dart';
import 'package:movies_app/core/resourses/manager_text_them_light.dart';
import 'package:flutter/material.dart';

ThemeData managerLightThemData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColorLight: ManagerColors.primaryColorLight,
    disabledColor: ManagerColors.textColor,
    splashColor: ManagerColors.greyLight,
    scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundColorDark,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ManagerColors.scaffoldBackgroundColorDark,
      elevation: Constant.elevationAppBar,
      titleTextStyle:
          getBoldStyle(fontSize: ManagerSize.s16, color: ManagerColors.white),
    ),
    buttonTheme: const ButtonThemeData(
        shape: RoundedRectangleBorder(),
        disabledColor: ManagerColors.greyLight,
        buttonColor: ManagerColors.buttonColorDarK),
    textTheme: ManagerTextThemLight(),
  );
}
