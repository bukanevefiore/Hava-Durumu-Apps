part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}
// hava durumunu getirme eventi
class FetchWeatherEvent extends WeatherEvent {

  final String sehirAdi;
  FetchWeatherEvent({@required this.sehirAdi});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class RefreshWeatherEvent extends WeatherEvent {
  final String sehirAdi;
  RefreshWeatherEvent(@required this.sehirAdi);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}