// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather/data/data_api.dart';

import '../../model/weather_model.dart';

part 'weather_cubit.freezed.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(
    this.data,
  ) : super(const _Initial());
  final DataApi data;
  void getData(String code) async {
    emit(const WeatherState.loading());
    var result = await data.getWeather(code: code);
    result.fold(
      (l) => emit(_Error(l)),
      (r) {
        DateTime now = DateTime.now();
        int date = now.day;
        List<WeatherModel> newDatas =
            r.where((element) => element.jamCuaca.day == date).toList();
        print(newDatas[3].jamCuaca);
        emit(_Loaded(newDatas));
      },
    );
  }

  void getDataNextDay(String code) async {
    emit(const WeatherState.loading());
    var result = await data.getWeather(code: code);
    result.fold(
      (l) => emit(_Error(l)),
      (r) {
        DateTime now = DateTime.now();
        int date = now.day;

        List<WeatherModel> newDatas =
            r.where((element) => element.jamCuaca.day == date + 1).toList();
        print(newDatas[2].toJson());
        emit(_Loaded(newDatas));
      },
    );
  }
}
