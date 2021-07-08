part of 'tema_bloc.dart';

abstract class TemaEvent extends Equatable {
  const TemaEvent();
  List<Object> get props => [];

}

class TemaDegistirEvent extends TemaEvent {
  final String havaDurumuKisaltmasi;
  TemaDegistirEvent(@required this.havaDurumuKisaltmasi);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
