import 'dart:developer';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/weather/weather_state.dart';
import 'package:weather/data/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  final weatherController = TextEditingController(text: "london");

  void getWeatherInfo() async {
    try {
      emit(WeatherLoading());
      final result =
          await WeatherService.getWeatherInfo(weatherController.text);
      emit(WeatherSuccess(result));
    } on SocketException catch (e) {
      log(e.message);
      emit(WeatherNetworkError("Network Error"));
    } catch (e) {
      log("$e");
      emit(WeatherFailure(failureMessage: '404 not found'));
    }
  }
}
