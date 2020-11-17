import 'dart:convert';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/States/WeatherState.dart';

class WeatherService {
  String api_key = "a34849fe2b9e02a1b12acf58cff72eb9";

  Future<Weather> getCurrentWeather(
      {query, String lat = '', String lon = ''}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?q=$query&lat=$lat&lon=$lon&appid=$api_key&units=metric&lang=ru';

    final response = await http.post(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      WeatherLoadFail();
    }
  }

  Future<List<Weather>> getHourlyWeather(
      {query, String lat = '', String lon = ''}) async {
    var url =
        'http://api.openweathermap.org/data/2.5/forecast?q=$query&lat=$lat&lon=$lon&appid=$api_key&units=metric&lang=ru';

    final response = await http.post(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      final List<Weather> data = (jsonData['list'] as List<dynamic>).map(
        (items) {
          return Weather.fromJson(items);
        },
      ).toList();
      print(data.length);
      return data;
    } else {
      throw Exception('Не удалось получить данные');
    }
  }
}
