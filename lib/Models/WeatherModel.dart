class Weather {
  String country;
  String city;
  int temperature;
  String iconCode;
  String descripstion;
  DateTime time;
  int min_temp;
  int max_temp;
  int sea_level;
  int ground_level;
  int humidity;
  int pressure;
  int feels_like;
  int visibility;
  int sunrise;
  int sunset;
  double windSpeed;

  Weather({
    this.city,
    this.country,
    this.descripstion,
    this.iconCode,
    this.temperature,
    this.time,
    this.feels_like,
    this.ground_level,
    this.humidity,
    this.max_temp,
    this.min_temp,
    this.pressure,
    this.sea_level,
    this.visibility,
    this.sunrise,
    this.sunset,
    this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      temperature: double.parse(json['main']['temp'].toString()).toInt(),
      iconCode: json['weather'][0]['icon'],
      descripstion: json['weather'][0]['description'],
      time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      max_temp: double.parse(json['main']['temp_max'].toString()).toInt(),
      min_temp: double.parse(json['main']['temp_min'].toString()).toInt(),
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      humidity: json['main']['humidity'],
      windSpeed: double.parse(json['wind']['speed'].toString()),
    );
  }
}
