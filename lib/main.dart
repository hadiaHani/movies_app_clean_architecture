import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movies_app/config/constant.dart';
import 'package:movies_app/config/dependency_injection.dart';
import 'package:movies_app/core/services/them_services.dart';
import 'package:movies_app/routes/routes.dart';

void main() async {
  await initModule();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final ThemServices _themeService;

  MyApp({super.key}) : _themeService = ThemServices();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(
        Constant.deviceWidth,
        Constant.deviceHeight,
      ),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.homeView,
          theme: _themeService.getThemeData(),
          themeMode: _themeService.getThemMode(),
        );
      },
    );
  }
}
