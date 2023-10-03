import 'package:flutter_bloc/flutter_bloc.dart';

class CodeCubit extends Cubit<String> {
  CodeCubit() : super("");

  void changeCode(String code) {
    emit(code);
  }
}
