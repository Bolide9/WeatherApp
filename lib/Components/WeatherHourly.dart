import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_app/Components/WeatherCart.dart';
import 'package:weather_app/Models/WeatherModel.dart';

class WeatherHourly extends StatelessWidget {
  final List<Weather> hourlyWeather;

  const WeatherHourly({Key key, this.hourlyWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hourlyWeather.length,
          itemBuilder: (context, i) {
            return WeatherCard(
              title:
                  '${hourlyWeather[i].time.hour}:${hourlyWeather[i].time.minute}0',
              temperature: hourlyWeather[i].temperature.toInt(),
              iconCode: hourlyWeather[i].iconCode,
              temperatureFontSize: 20,
            );
          },
        ),
      ),
    );
  }
}
