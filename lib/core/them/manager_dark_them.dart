import 'package:movies_app/config/constant.dart';
import 'package:movies_app/core/resourses/manager_color.dart';
import 'package:movies_app/core/resourses/manager_fonts.dart';
import 'package:movies_app/core/resourses/manager_styles.dart';
import 'package:movies_app/core/resourses/manager_text_them_dark.dart';
import 'package:flutter/material.dart';

ThemeData managerDarkThemData() {
  return ThemeData.dark().copyWith(
      useMaterial3: true,
      primaryColor: ManagerColors.primaryColor,
      primaryColorDark: ManagerColors.primaryColorDark,

      // this for disabled button colors
      disabledColor: ManagerColors.disabledColor,
      splashColor: ManagerColors.greyLight,
      scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundColorDark,

      /// APP BAR THEME
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ManagerColors.greyLight,
        elevation: Constant.elevationAppBar,
        titleTextStyle: getBoldStyle(
          fontSize: ManagerFontSize.s14,
          color: ManagerColors.white,
        ),
      ),

      /// BUTTON THEME
      buttonTheme: const ButtonThemeData(
        shape: RoundedRectangleBorder(),
        disabledColor: ManagerColors.greyLight,
        buttonColor: ManagerColors.buttonColorDarK,
      ),
      textTheme: ManagerTextThemDark());
}
