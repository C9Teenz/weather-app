import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/data/data_api.dart';

import '../../model/weather_model.dart';

part 'current_weather_state.dart';
part 'current_weather_cubit.freezed.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit() : super(const _Initial());

  void getData(String code) async {
    emit(const CurrentWeatherState.loading());
    var result = await DataApi().getWeather(code: code);
    result.fold(
      (l) => emit(CurrentWeatherState.error(l)),
      (r) {
        DateTime now = DateTime.now();
        int hour = now.hour;
        int date = now.day;
        List<WeatherModel> newDatas =
            r.where((element) => element.jamCuaca.day == date).toList();
        late WeatherModel newData;

        for (var x in newDatas) {
          int time = 0;
          if (x.jamCuaca.hour - hour <= time) {
            newData = x;
          }
        }
        
        emit(CurrentWeatherState.loaded(newData));
      },
    );
  }
}
