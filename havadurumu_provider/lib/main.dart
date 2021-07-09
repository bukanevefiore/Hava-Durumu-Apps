import 'package:flutter/material.dart';
import 'package:havadurumu_provider/locator.dart';
import 'package:havadurumu_provider/viewmodels/weather_view_model.dart';
import 'package:provider/provider.dart';

import 'widget/weather_app.dart';



void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<WeatherViewModel>(
          create: (context) => locator<WeatherViewModel>(),
          child: WeatherApp()),
    );
  }
}

