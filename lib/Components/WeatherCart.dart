import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final int tempetature;
  final String iconCode;
  final double temperatureFontSize;
  final double iconSize;

  const WeatherCard({
    Key key,
    this.title,
    this.tempetature,
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
          child: Column(
            children: [
              Text(this.title),
              Image.network(
                "http://openweathermap.org/img/wn/${this.iconCode}@2x.png",
                scale: this.iconSize,
              ),
              Text(
                '${this.tempetature}',
                style: TextStyle(
                  fontSize: this.temperatureFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
