class Weather {
  String country;
  String city;
  int temperature;
  String iconCode;
  String descripstion;
  DateTime time;

  Weather({
    this.city,
    this.country,
    this.descripstion,
    this.iconCode,
    this.temperature,
    this.time,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        city: json['name'],
        temperature: double.parse(json['main']['temp'].toString()).toInt(),
        iconCode: json['weather'][0]['icon'],
        descripstion: json['weather'][0]['main'],
        time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000));
  }
}
