// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:weather/cubit/location/location_cubit.dart';
import 'package:weather/page/mobile/weather_mobile.dart';
import 'package:weather/page/web/weather_web.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    context.read<LocationCubit>().getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize the locale-specific date formatting data for 'id_ID'
    initializeDateFormatting('id_ID', null);

    // Get the current date and time
    DateTime now = DateTime.now();

    // Define the desired date and time format
    final dateFormat = DateFormat('EEEE, d MMMM HH:mm', 'id_ID');

    // Format the current date and time
    String formattedDateTime = dateFormat.format(now);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return WeatherMobile(formattedDateTime: formattedDateTime);
        } else {
          return WeatherWeb(formattedDateTime: formattedDateTime);
        }
      },
    );
  }
}
