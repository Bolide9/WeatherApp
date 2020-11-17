import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final int temperature;
  final String iconCode;
  final double temperatureFontSize;
  final double iconSize;

  const WeatherCard({
    Key key,
    this.title,
    this.temperature,
    this.iconCode,
    this.temperatureFontSize = 28,
    this.iconSize = 2,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Text(this.title),
                Image.network(
                  "http://openweathermap.org/img/wn/${this.iconCode}@2x.png",
                  scale: this.iconSize,
                ),
                Text(
                  '${this.temperature}',
                  style: TextStyle(
                    fontSize: this.temperatureFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
