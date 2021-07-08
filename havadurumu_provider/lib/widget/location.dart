import 'package:flutter/cupertino.dart';

class LocationWidget extends StatelessWidget {

  final String secilenSehir;
  LocationWidget({@required this.secilenSehir});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Ankara"));
  }
}
