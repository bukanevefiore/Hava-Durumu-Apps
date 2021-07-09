import 'package:flutter/material.dart';
import 'package:havadurumu_provider/viewmodels/weather_view_model.dart';
import 'package:havadurumu_provider/widget/sehir_sec.dart';
import 'package:provider/provider.dart';

import 'hava_durumu_resim.dart';
import 'location.dart';
import 'max_min_sicaklik.dart';
import 'son_guncelleme.dart';

class WeatherApp extends StatelessWidget {

  String kullanicininSectigiSehir = "Ankara";

  @override
  Widget build(BuildContext context) {

    final _weatherViewModel = Provider.of<WeatherViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Weather App"),
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: () async {
          kullanicininSectigiSehir = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SehirSecWidget()));
          _weatherViewModel.havaDurumunuGetir(kullanicininSectigiSehir);
          debugPrint(kullanicininSectigiSehir);
        }),
      ],),
      body: Center(
        child: (_weatherViewModel.state) == WeatherState.WeatherLoadedState ? havaDurumuGeldi() :
          (_weatherViewModel.state) == WeatherState.WeatherLoadingState ? havaDurumuGetiriliyor() :
          (_weatherViewModel.state) == WeatherState.WeatherErrorState ? havaDurumuHata() : Text("Şehir seçin"),
      ),
    );
  }

  ListView havaDurumuGeldi() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: LocationWidget(secilenSehir: kullanicininSectigiSehir,)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: SonGuncellemeWidget()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: HavaDurumuResimWidget()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: MaxVeMinSicaklikWidget()),
        ),
      ],
    );
  }

  havaDurumuHata() {

    return Text("Hava durumu yüklenirken hata oluştu");
  }

  havaDurumuGetiriliyor() {
    return CircularProgressIndicator();
  }

}
