import 'package:equatable/equatable.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];

}


class WeatherInitital extends WeatherState{

}

class WeatherInProgress extends WeatherState{
  
}

class WeatherLoadSuccess extends WeatherState{
  
}

class WeatherLoadFail extends WeatherState{
  
}