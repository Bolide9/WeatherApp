import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Events/WeatherEvent.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/Services/WeatherService.dart';
import 'package:weather_app/States/WeatherState.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(WeatherState initialState) : super(initialState);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield WeatherInProgress();
      try {
        final Weather weather =
            await WeatherService().getCurrentWeather(query: event.city);
        final List<Weather> hourlyWeather =
            await WeatherService().getHourlyWeather(query: event.city);
        yield WeatherLoadSuccess(
            weather: weather, hourlyWeather: hourlyWeather);
      } catch (_) {
        yield WeatherLoadFail();
      }
    }
  }
}
