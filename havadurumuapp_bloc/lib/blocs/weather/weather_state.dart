part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  String sehirAdi;
  @override
  List<Object> get props => [sehirAdi];

}

class WeatherInitial extends WeatherState {

}

class WeatherLoadingState extends WeatherState {


  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class WeatherLoadedState extends WeatherState {

  final Weather weather;
  WeatherLoadedState({this.weather});
  List<Object> get props => [weather];
}

class WeatherErrorState extends WeatherState {

}
