import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/Widgets/Value_Title.dart';

class WeatherWidget extends StatelessWidget {
  final Weather? weather;

  const WeatherWidget({Key? key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            child: Divider(
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ValueTile(
                "Скорость ветра",
                this.weather!.windSpeed.toString() + ' м/с',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: 1,
                  height: 45,
                  color: Colors.white,
                ),
              ),
              ValueTile(
                "Восход",
                DateFormat('h:mm').format(
                  DateTime.fromMillisecondsSinceEpoch(
                      this.weather!.sunrise! * 1000),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: 1,
                  height: 45,
                  color: Colors.white,
                ),
              ),
              ValueTile(
                "Заход",
                DateFormat('h:mm').format(
                  DateTime.fromMillisecondsSinceEpoch(
                    this.weather!.sunset! * 1000,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: 1,
                  height: 45,
                  color: Colors.white,
                ),
              ),
              ValueTile("Влажность", '${weather!.humidity}%'),
            ],
          ),
        ],
      ),
    );
  }
}
