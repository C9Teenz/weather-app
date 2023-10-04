// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:weather/Utils/constant.dart';

import 'package:weather/model/weather_model.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({
    Key? key,
    required this.height,
    required this.width,
    required this.data,
  }) : super(key: key);
  final double height;
  final double width;
  final WeatherModel data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: height,
      width: width,
      margin: const EdgeInsets.only(right: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${data.jamCuaca.hour}:00'),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: const Color(0xff5A99F2),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(ConstantData.image[data.kodeCuaca]!))),
          ),
          Text(
            '${data.tempC}°',
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black),
          )
        ],
      ),
    );
  }
}
