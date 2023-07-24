import 'package:movies_app/core/resourses/manager_color.dart';
import 'package:movies_app/core/resourses/manager_fonts.dart';
import 'package:movies_app/core/resourses/manager_size.dart';
import 'package:movies_app/core/resourses/manager_styles.dart';
import 'package:movies_app/core/widget/main_button.dart';
import 'package:flutter/material.dart';

Widget dialogButton({
  void Function()? onPressed,
  required String message,
}) {
  return mainButton(
    child: Text(
      message,
      style: getMediumStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.white,
      ),
    ),
    onPressed: onPressed,
    color: ManagerColors.primaryColor,
    height: ManagerHeight.h40,
  );
}
