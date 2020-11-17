import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Bloc/WeatherBloc.dart';
import 'package:weather_app/Components/WeatherMainScreenWrapper.dart';
import 'package:weather_app/States/WeatherState.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

enum OptionsMenu { settings }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Weather App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _cityName = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc('Грозный'),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadSuccess) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                title: Text(
                  DateFormat('dd.MM.yyyy').format(DateTime.now()).toString(),
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                actions: [
                  PopupMenuButton<OptionsMenu>(
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onSelected: this._onOptionMenuItemSelected,
                    itemBuilder: (context) => <PopupMenuEntry<OptionsMenu>>[
                      PopupMenuItem<OptionsMenu>(
                        value: OptionsMenu.settings,
                        child: Text("Настройки"),
                      ),
                    ],
                  )
                ],
              ),
              body: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: WeatherMainScreenWrapper(
                    weather: state.weather,
                    hourlyWeak: state.hourlyWeather,
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Идет загрузка...'),
                  SizedBox(height: 24),
                  SizedBox(
                    height: 48,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showCityChangeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Поменять город', style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'OK',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          content: TextField(
            autofocus: true,
            onChanged: (value) {
              _cityName.text = value;
            },
            decoration: InputDecoration(
                hintText: 'Город',
                hintStyle: TextStyle(color: Colors.black),
                suffixIcon: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.my_location,
                    color: Colors.black,
                    size: 16,
                  ),
                )),
            style: TextStyle(color: Colors.black),
            cursorColor: Colors.black,
          ),
        );
      },
    );
  }

  _onOptionMenuItemSelected(OptionsMenu item) {
    switch (item) {
      case OptionsMenu.settings:
        break;
    }
  }
}
