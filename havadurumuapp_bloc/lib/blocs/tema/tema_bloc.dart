import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'tema_event.dart';
part 'tema_state.dart';

class TemaBloc extends Bloc<TemaEvent, TemaState> {
  TemaBloc() : super(UygulamaTemasi(ThemeData.light(), Colors.red));

  @override
  Stream<TemaState> mapEventToState(TemaEvent event,) async* {

    UygulamaTemasi uygulamaTemasi;
    if(event is TemaDegistirEvent) {
      switch(event.havaDurumuKisaltmasi){
        case "sn":
        case "sl":
        case "h":
        case "t":
        case "hc":
          uygulamaTemasi = await UygulamaTemasi(ThemeData(primaryColor: Colors.grey), Colors.white);
              break;
        case "hr":
        case "lr":
        case "s":
            uygulamaTemasi = await UygulamaTemasi(ThemeData(primaryColor: Colors.blue), Colors.white);
            break;
        case "lc":
        case "c":
          uygulamaTemasi = await UygulamaTemasi(ThemeData(primaryColor: Colors.deepOrange), Colors.yellow);
          break;
      }
      yield uygulamaTemasi;
    }
    

  }
}
