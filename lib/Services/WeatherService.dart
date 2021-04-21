import 'dart:convert';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const api_key = "a34849fe2b9e02a1b12acf58cff72eb9";

  Future getCurrentWeather({query, String lat = '', String lon = ''}) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$query&lat=$lat&lon=$lon&appid=$api_key&units=metric&lang=ru';

    Uri uri = Uri.parse(url);

    final response = await http.post(uri);

    return Weather.fromJson(json.decode(response.body));
  }

  Future<List<Weather>> getHourlyWeather(
      {query, String lat = '', String lon = ''}) async {
    String url =
        'https://api.openweathermap.org/data/2.5/forecast?q=$query&lat=$lat&lon=$lon&appid=$api_key&units=metric&lang=ru';

    Uri uri = Uri.parse(url);

    final response = await http.post(uri);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      final List<Weather> data = (jsonData['list'] as List<dynamic>).map(
        (items) {
          return Weather.fromJson(items);
        },
      ).toList();

      return data;
    } else {
      throw Exception('Не удалось получить данные');
    }
  }
}
