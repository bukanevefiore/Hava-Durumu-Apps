import 'package:flutter/material.dart';

import 'hava_durumu_resim.dart';
import 'location.dart';
import 'max_min_sicaklik.dart';
import 'sehir_sec.dart';
import 'son_guncelleme.dart';


class WeatherApp extends StatelessWidget {

  String _kullanicininSectigiSehir = "Ankara";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Weather App"),
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: () async {
          _kullanicininSectigiSehir = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SehirSecWidget()));
          debugPrint(_kullanicininSectigiSehir);
        }),
      ],
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: LocationWidget(secilenSehir: _kullanicininSectigiSehir,)),
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
              padding: const EdgeInsets.all(16.0),
              child: Center(child: MaxVeMinSicaklikWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
