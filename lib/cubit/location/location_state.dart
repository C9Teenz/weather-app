part of 'location_cubit.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.loading() = _Loading;
  const factory LocationState.loaded(List<LocationModel> model) = _Loaded;
  const factory LocationState.error(String error) = _Error;
}
