import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather/data/endpoints.dart';
import 'package:weather/data/model/weather_response_model.dart';

class WeatherService {
  static Future<WeatherResponseModel> getWeatherInfo(String city) async {
    try {
      final endpoint = Endpoints.weatherUrl(city);
      final url = Uri.parse(endpoint);
      final response = await http.get(url);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return WeatherResponseModel.fromJson(data);
      }
      throw Exception();
    } on SocketException catch (e) {
      throw SocketException("$e");
    } catch (e) {
      throw Exception();
    }
  }
}
