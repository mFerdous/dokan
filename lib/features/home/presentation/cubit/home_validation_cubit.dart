// ignore_for_file: empty_catches

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_validation_state.dart';

class HomeValidationCubit extends Cubit<HomeValidationState> {
  HomeValidationCubit() : super(HomeValidationInitial());

  setSelectedIndex(int index) async {
    emit(state.copyWith(selectedIndex: index));
  }
  
Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String accessToken = sharedPreferences.getString("access_token")?? '';
    emit(state.copyWith(accessToken: accessToken));
    return accessToken;
  }
}
