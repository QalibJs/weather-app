import 'package:weather/data/model/weather_response_model.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherFailure extends WeatherState {
  final String failureMessage;

  WeatherFailure({required this.failureMessage});
}

final class WeatherNetworkError extends WeatherState {
  final String message;

  WeatherNetworkError(this.message);
}

final class WeatherSuccess extends WeatherState {
  final WeatherResponseModel response;

  WeatherSuccess(this.response);
}
