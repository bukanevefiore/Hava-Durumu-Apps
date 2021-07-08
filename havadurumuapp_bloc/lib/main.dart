import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havadurumuapp_bloc/blocs/tema/tema_bloc.dart';
import 'package:havadurumuapp_bloc/blocs/weather/weather_bloc.dart';
import 'package:havadurumuapp_bloc/locator.dart';

import 'widget/weather_app.dart';

void main() {
  setupLocator();
  runApp(BlocProvider(
    create: (context) => TemaBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<TemaBloc>(context),
      builder: (context, TemaState state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: (state as UygulamaTemasi).tema,
          home: BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(),
            child: WeatherApp(),
          ),
        );
      },
    );
  }
}

