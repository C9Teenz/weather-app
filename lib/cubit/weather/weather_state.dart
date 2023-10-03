part of 'weather_cubit.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.loading() = _Loading;
  const factory WeatherState.loaded(List<WeatherModel> model) = _Loaded;
  const factory WeatherState.error(String error) = _Error;
}
