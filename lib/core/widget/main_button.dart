import 'package:movies_app/core/resourses/manager_size.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/extension/extension.dart';

Widget mainButton({
  required Widget child,
  void Function()? onPressed,
  ShapeBorder? shapeBorder,
  Color? color,
  double? minWidth,
  double? height,
  double? elevation,
  EdgeInsetsGeometry? padding,
}) {
  return MaterialButton(
    padding: padding,
    onPressed: onPressed.onNull(),
    shape: shapeBorder ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r12,
          ),
        ),
    color: color.onNull(),
    minWidth: minWidth.onNull(),
    height: height.onNull(),
    elevation: elevation.onNull(),
    child: child,
  );
}
