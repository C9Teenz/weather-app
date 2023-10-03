// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:weather/data/data_api.dart';

import '../../model/location_model.dart';

part 'location_cubit.freezed.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(
    this.data,
  ) : super(const _Initial());
  final DataApi data;

  void getData() async {
    emit(const LocationState.loading());
    var result = await data.getLocation();
    result.fold(
      (l) => emit(LocationState.error(l)),
      (r) => emit(LocationState.loaded(r)),
    );
  }
}
