
import 'package:havadurumu_provider/data/weather_api_client.dart';
import 'package:havadurumu_provider/locator.dart';
import 'package:havadurumu_provider/models/weather.dart';

class WeatherRepository {

  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWaether(String sehir)  async {

    final int sehirID = await weatherApiClient.getLocation(sehir);
    return await weatherApiClient.getWeather(sehirID);
  }

}