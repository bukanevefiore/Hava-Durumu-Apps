import 'package:get_it/get_it.dart';
import 'package:havadurumu_provider/data/weather_api_client.dart';
import 'package:havadurumu_provider/data/weather_repository.dart';
import 'package:havadurumu_provider/viewmodels/weather_view_model.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {

  locator.registerLazySingleton(() => WeatherApiClient());
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerFactory(() => WeatherViewModel());
}