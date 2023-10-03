// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:weather/Utils/constant.dart';

class WeatherItemNoData extends StatelessWidget {
  const WeatherItemNoData({
    Key? key,
    required this.height,
    required this.width,
    required this.data,
  }) : super(key: key);
  final double height;
  final double width;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$data:00'),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: const Color(0xff5A99F2),
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage(ConstantData.noweather))),
          ),
          const Text(
            '______°',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black),
          )
        ],
      ),
    );
  }
}
