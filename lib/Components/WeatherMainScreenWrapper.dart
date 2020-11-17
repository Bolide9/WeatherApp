import 'package:flutter/material.dart';
import 'package:weather_app/Components/WeatherHourly.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/Widgets/Value_Title.dart';
import 'package:weather_app/Widgets/Weather_Divider_Widget.dart';

class WeatherMainScreenWrapper extends StatefulWidget {
  final Weather weather;
  final List<Weather> hourlyWeak;

  const WeatherMainScreenWrapper({Key key, this.weather, this.hourlyWeak})
      : super(key: key);

  @override
  _WeatherMainScreenWrapperState createState() =>
      _WeatherMainScreenWrapperState(this.weather, this.hourlyWeak);
}

class _WeatherMainScreenWrapperState extends State<WeatherMainScreenWrapper> {
  final Weather weather;
  final List<Weather> hourlyWeak;

  _WeatherMainScreenWrapperState(this.weather, this.hourlyWeak);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          Text(
            weather.city,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          Text(
            weather.descripstion[0].toUpperCase() +
                weather.descripstion.substring(1),
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              '${this.weather.temperature}°',
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ValueTile("Макс", '${this.weather.max_temp}°'),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Center(
                  child: Container(
                    width: 1,
                    height: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              ValueTile("Мин", '${this.weather.min_temp}°'),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          WeatherHourly(
            hourlyWeather: this.hourlyWeak,
          ),
          WeatherWidget(
            weather: weather,
          ),
        ],
      ),
    );
  }
}
