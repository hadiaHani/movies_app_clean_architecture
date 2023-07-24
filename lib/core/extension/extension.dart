import 'dart:ui';

import 'package:movies_app/core/resourses/manager_color.dart';

extension NonNullString on String? {
  String onNull() {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }
}

extension NonNullList on List<int>? {
  List<int> onNull() {
    if (this == null) {
      return [];
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double onNull() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int onNull() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullBoolean on bool? {
  bool onNull() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

extension NonNullColor on Color? {
  Color onNull() {
    if (this == null) {
      return ManagerColors.transparent;
    } else {
      return this!;
    }
  }
}

extension NonNullFunction on void Function()? {
  void Function() onNull() {
    if (this == null) {
      return () {};
    } else {
      return this!;
    }
  }
}

extension NonNullFunctionBool on bool Function()? {
  bool Function() onNull() {
    if (this == null) {
      return () {
        return false;
      };
    } else {
      return this!;
    }
  }
}
