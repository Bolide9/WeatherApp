import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/Bloc/WeatherBloc.dart';
import 'package:weather_app/States/WeatherState.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather_app/geoLocation.dart';

import 'Pages/WeatherPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WWeather',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: 'Weather App',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String city;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  Future<String> getCity() async => city = (await GeoLocation().getCity())!;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCity(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return BlocProvider(
            create: (context) => WeatherBloc(city),
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoadSuccess) {
                  return WeatherPage(
                    state: state,
                  );
                }

                if (state is WeatherLoadFail) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text('Похожа возникла какая-то ошибка'),
                        ),
                        SizedBox(height: 12),
                        TextButton(
                          clipBehavior: Clip.none,
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                                (Route<dynamic> route) => false);
                          },
                          child: Text(
                            'Попробовать снова',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Получаем текущую погоду...'),
                        SizedBox(height: 24),
                        SizedBox(
                          height: 48,
                        ),
                        CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }

        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Получаем текущую позицию...'),
                SizedBox(height: 24),
                SizedBox(
                  height: 48,
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
