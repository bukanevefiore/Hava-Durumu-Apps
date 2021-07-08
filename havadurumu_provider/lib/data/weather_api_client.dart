import 'dart:convert';

import 'package:havadurumu_provider/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {

   static const baseURL = "https://www.metaweather.com";
   final http.Client httpClient = http.Client();

   // şehir ismine göre id alıyoruz
   Future<int> getLocation(String sehirAdi) async {
     final sehirURL = baseURL+"/api/location/search/?query="+sehirAdi;
     final gelenCevap = await httpClient.get(Uri.parse(sehirURL));

     if(gelenCevap.statusCode != 200){
       throw Exception("Veri getirilemedi");
     }

     final gelenCevapJSON = (jsonDecode(gelenCevap.body)) as List;
     return gelenCevapJSON[0]["woeid"];
   }

   // belirlenen sehir id ye göre hava durumu bilgilerini alıyoruz
   Future<Weather> getWeather(int sehirID) async {

     final havaDurumuURL = baseURL+"/api/location/$sehirID/";
     final havaDurumuGelenCevap = await httpClient.get(Uri.parse(havaDurumuURL));

     if(havaDurumuGelenCevap.statusCode != 200){
       throw Exception("Veri getiirlemedi");
     }

     final havaDurumuGelenCevapJSON = (jsonDecode(havaDurumuGelenCevap.body));
     return Weather.fromJson(havaDurumuGelenCevapJSON);
   }


  // Image.network("https://www.metaweather.com//static/img/weather/png/" ".png",


}