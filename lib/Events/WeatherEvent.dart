abstract class WeatherEvent {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  final String city;
  final String lat;
  final String lon;

  const WeatherRequested({this.city = '', this.lat = '', this.lon = ''});

  List<Object> get props => [city];
}
