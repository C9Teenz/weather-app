part of 'current_weather_cubit.dart';

@freezed
@Freezed(makeCollectionsUnmodifiable: false)
class CurrentWeatherState with _$CurrentWeatherState {
  const factory CurrentWeatherState.initial() = _Initial;
  const factory CurrentWeatherState.loading() = _Loading;
  const factory CurrentWeatherState.loaded(WeatherModel model) = _Loaded;
  const factory CurrentWeatherState.error(String error) = _Error;
}
