import 'package:flutter/material.dart';
import 'package:weather_app/Components/WeatherCart.dart';
import 'package:weather_app/Components/WeatherHourly.dart';
import 'package:weather_app/Models/WeatherModel.dart';

class WeatherMainScreenWrapper extends StatelessWidget {
  final Weather weather;
  final List<Weather> hourlyWeak;

  const WeatherMainScreenWrapper({Key key, this.weather, this.hourlyWeak})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 48),
          Text(
            weather.city,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 48),
          WeatherCard(
            title: 'Погода',
            temperature: weather.temperature,
            iconCode: weather.iconCode,
            temperatureFontSize: 64,
            iconSize: 1,
          ),
          SizedBox(height: 48),
          WeatherHourly(
            hourlyWeather: this.hourlyWeak,
          ),
        ],
      ),
    );
  }
}
