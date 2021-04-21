import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../Bloc/WeatherBloc.dart';
import '../Components/WeatherMainScreenWrapper.dart';
import '../Events/WeatherEvent.dart';

class WeatherPage extends StatefulWidget {
  final state;

  WeatherPage({required this.state});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextFormField(
                  controller: _cityController,
                  autofocus: false,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'Введите город: ',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2.0,
                      ),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    BlocProvider.of<WeatherBloc>(context)
                        .add(WeatherRequested(city: value));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: WeatherMainScreenWrapper(
                  weather: widget.state.weather,
                  hourlyWeak: widget.state.hourlyWeather,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
