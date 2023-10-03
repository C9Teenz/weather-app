import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/code/code_cubit.dart';
import 'package:weather/cubit/current_weather/current_weather_cubit.dart';
import 'package:weather/cubit/location/location_cubit.dart';
import 'package:weather/cubit/navbar/navbar_cubit.dart';
import 'package:weather/cubit/weather/weather_cubit.dart';
import 'package:weather/data/data_api.dart';
import 'package:weather/page/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(DataApi()),
        ),
        BlocProvider<CurrentWeatherCubit>(
          create: (context) => CurrentWeatherCubit(),
        ),
        BlocProvider<NavbarCubit>(
          create: (context) => NavbarCubit(),
        ),
        BlocProvider<CodeCubit>(
          create: (context) => CodeCubit(),
        ),
        BlocProvider<LocationCubit>(
          create: (context) => LocationCubit(DataApi()),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashPage()),
    );
  }
}
