import 'dart:convert';

import 'package:havadurumuapp_bloc/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {

  static const baseUrl = "https://www.metaweather.com";
  final http.Client httpClient = http.Client();

  // şehir ismine göre şehir id yi alıyoruz
  Future<int> getLocationID(String sehirAdi) async {
    final sehirURL = baseUrl+"/api/location/search/?query="+sehirAdi;
    final gelenCevap = await httpClient.get(Uri.parse(sehirURL));

    if(gelenCevap.statusCode != 200){
      throw Exception("Veri getirilemedi");
    }

    final geleCevapJSON = (jsonDecode(gelenCevap.body)) as List;
    return geleCevapJSON[0]["woeid"];
  }

  // yukarıda belirlenen sehir id ye göre şehir hava durumu bilgilerini çekiyoruz
  Future<Weather> getWeather(int sehirID) async {
    final havaDurumuURL = baseUrl+"/api/location/$sehirID/";
    final havaDurumuGelenCevap = await httpClient.get(Uri.parse(havaDurumuURL));

    if(havaDurumuGelenCevap.statusCode != 200) {
      throw Exception("Veri getirilemedi");
    }

    final havaDurumuGelenCevapJSON = jsonDecode(havaDurumuGelenCevap.body);
    return Weather.fromJson(havaDurumuGelenCevapJSON);
  }

}