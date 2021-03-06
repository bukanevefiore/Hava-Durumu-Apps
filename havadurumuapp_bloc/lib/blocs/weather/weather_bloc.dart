
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:havadurumuapp_bloc/data/weather_repository.dart';
import 'package:havadurumuapp_bloc/locator.dart';
import 'package:havadurumuapp_bloc/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  WeatherRepository weatherRepository = locator<WeatherRepository>();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event,) async* {

    if(event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try{

        final Weather getirilenWeather = await weatherRepository.getWeather(event.sehirAdi);
        yield WeatherLoadedState(weather: getirilenWeather);
      }catch(_) {
        yield WeatherErrorState();
      }
    }
    else if(event is RefreshWeatherEvent){
      try{
        final Weather getirilenWeather = await weatherRepository.getWeather(event.sehirAdi);
        yield WeatherLoadedState(weather: getirilenWeather);
      }catch(_){
        yield state;
      }
    }
  }
}
