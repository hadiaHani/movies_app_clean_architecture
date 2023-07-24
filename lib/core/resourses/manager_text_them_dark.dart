import 'package:movies_app/core/resourses/manager_color.dart';
import 'package:movies_app/core/resourses/manager_fonts.dart';
import 'package:movies_app/core/resourses/manager_styles.dart';
import 'package:flutter/material.dart';

class ManagerTextThemDark extends TextTheme {
  @override
  TextStyle get displayMedium => getMediumStyle(
        fontSize: ManagerFontSize.s20,
        color: ManagerColors.textColorDark,
      );

  @override
  TextStyle get displaySmall => getBoldStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorDark,
      );

  @override
  TextStyle get headlineMedium => getMediumStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorDark,
      );

  @override
  TextStyle get titleMedium => getMediumStyle(
        fontSize: ManagerFontSize.s14,
        color: ManagerColors.textColorDark,
      );

  @override
  TextStyle get bodyLarge => getRegularTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColorDark,
      );
}
