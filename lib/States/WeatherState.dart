import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/Models/WeatherModel.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitital extends WeatherState {}

class WeatherInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;
  final List<Weather> hourlyWeather;

  WeatherLoadSuccess({@required this.weather, @required this.hourlyWeather})
      : assert(weather != null);

  @override
  List<Object> get props => [weather];
}

class WeatherLoadFail extends WeatherState {
  
}
