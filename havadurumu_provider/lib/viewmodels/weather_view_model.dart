

import 'package:flutter/cupertino.dart';
import 'package:havadurumu_provider/data/weather_repository.dart';
import 'package:havadurumu_provider/locator.dart';
import 'package:havadurumu_provider/models/weather.dart';

enum WeatherState{InitialWeatherState, WeatherLoadingState, WeatherLoadedState, WeatherErrorState}

class WeatherViewModel with ChangeNotifier {

  WeatherState _state;
  WeatherRepository _weatherRepository = locator<WeatherRepository>();
  Weather _getirilenWeather;

  WeatherViewModel() {
    _getirilenWeather = Weather();
    _state = WeatherState.InitialWeatherState;
  }

  WeatherState get state => _state;

  set state(WeatherState value) {
    _state = value;
  }


  Weather get getirilenWeather => _getirilenWeather;

  Future<Weather> havaDurumunuGetir(String sehirAdi) async {

    try{
      state =WeatherState.WeatherLoadingState;
      _getirilenWeather = await _weatherRepository.getWaether(sehirAdi);
      state = WeatherState.WeatherLoadedState;

    }catch (e) {
      state = WeatherState.WeatherErrorState;
    }
    return _getirilenWeather;
  }

}