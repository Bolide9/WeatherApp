import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_app/Components/WeatherCard.dart';
import 'package:weather_app/Models/WeatherModel.dart';

class WeatherHourly extends StatelessWidget {
  final List<Weather>? hourlyWeather;

  const WeatherHourly({Key? key, this.hourlyWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: hourlyWeather!.length,
        itemBuilder: (context, i) {
          return WeatherCard(
            title:
                '${hourlyWeather![i].time!.hour}:${hourlyWeather![i].time!.minute}0',
            temperature: (hourlyWeather![i].temperature.toString() + '°'),
            iconCode: hourlyWeather![i].iconCode,
            temperatureFontSize: 20,
          );
        },
      ),
    );
  }
}
