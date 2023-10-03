// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:weather/Utils/constant.dart';

class SplashMobile extends StatelessWidget {
  const SplashMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(ConstantData.logo))),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Weather App",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
