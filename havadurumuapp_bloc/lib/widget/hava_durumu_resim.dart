import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havadurumuapp_bloc/blocs/weather/weather_bloc.dart';

class HavaDurumuResimWidget extends StatelessWidget {
  const HavaDurumuResimWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder(
        bloc: _weatherBloc,
        builder: (context, WeatherState state) =>
            Column(
              children: [
                Text((state as WeatherLoadedState).weather.consolidatedWeather[0].theTemp.floor().toString()+" C",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                Image.network("https://www.metaweather.com//static/img/weather/png/" +(state as WeatherLoadedState).weather.consolidatedWeather[0].weatherStateAbbr +".png",
                  width: 150,height: 150,),
              ],
            ),);

  }
}
