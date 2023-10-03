import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather/model/location_model.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/Utils/constant.dart';

class DataApi {
  Future<Either<String, List<WeatherModel>>> getWeather(
      {required String code}) async {
    try {
      var response = await Dio().get(
        "${ConstantData.baseUrl}/cuaca/$code.json",
      );

      List result = response.data;

      return Right(result.map((e) => WeatherModel.fromJson(e)).toList());
    } catch (e) {
      return Left("$e");
    }
  }

  Future<Either<String, List<LocationModel>>> getLocation() async {
    try {
      var response = await Dio().get(
        "${ConstantData.baseUrl}/cuaca/wilayah.json",
      );
      List data = response.data;
      print(data);
      return Right(data.map((item) => LocationModel.fromJson(item)).toList());
    } catch (e) {
      return Left('$e');
    }
  }
}
