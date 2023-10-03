// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'package:weather/page/mobile/splash_mobile.dart';
import 'package:weather/page/weather_page.dart';
import 'package:weather/page/web/splash_web.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const WeatherPage(),
          ),
          (route) => false),
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return const SplashMobile();
        } else {
          return const SplashWeb();
        }
      },
    );
  }
}
