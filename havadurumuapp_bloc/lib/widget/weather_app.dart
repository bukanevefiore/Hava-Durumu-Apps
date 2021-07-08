import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havadurumuapp_bloc/blocs/tema/tema_bloc.dart';
import 'package:havadurumuapp_bloc/blocs/weather/weather_bloc.dart';
import 'package:havadurumuapp_bloc/widget/gecisli_arkaplan_rengi.dart';

import 'hava_durumu_resim.dart';
import 'location.dart';
import 'max_min_sicaklik.dart';
import 'sehir_sec.dart';
import 'son_guncelleme.dart';


class WeatherApp extends StatelessWidget {

  String _kullanicininSectigiSehir = "Ankara";
  Completer<void> _refreshCompleter = Completer<void>();

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Weather App"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () async {
            _kullanicininSectigiSehir = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SehirSecWidget()));
            debugPrint(_kullanicininSectigiSehir);
            if (_kullanicininSectigiSehir != null) {
              _weatherBloc.add(
                  FetchWeatherEvent(sehirAdi: _kullanicininSectigiSehir));
            }
          }),
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (context, WeatherState state) {
            if (state is WeatherInitial) {
              return Center(child: Text("Şehir seçiniz.."));
            }
            if (state is WeatherLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoadedState) {
              final getirilenWeather = state.weather;
              final havaDurumuKisaltma = getirilenWeather.consolidatedWeather[0]
                  .weatherStateAbbr;
              _kullanicininSectigiSehir = getirilenWeather.title;
              BlocProvider.of<TemaBloc>(context).add(
                  TemaDegistirEvent(havaDurumuKisaltma));

              _refreshCompleter.complete();
              _refreshCompleter = Completer();

              return BlocBuilder(
                bloc: BlocProvider.of<TemaBloc>(context),
                builder: (context, TemaState temaState) {
                  return GecisliArkaplanRenkContainer(
                    (temaState as UygulamaTemasi).renk,
                     RefreshIndicator(
                      onRefresh: () {
                        _weatherBloc.add(
                            RefreshWeatherEvent(_kullanicininSectigiSehir));
                        return _refreshCompleter.future;
                      },
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: LocationWidget(
                              secilenSehir: getirilenWeather.title,)),
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
                        // ignore: missing_return
                      ),
                    ),
                  );
                },
              );
            }
            if (state is WeatherErrorState) {
              return Center(child: Text("Hata oluştu"));
            }
          },
        ),
      ),
    );
  }
}
