import 'package:flutter/material.dart';

class MaxVeMinSicaklikWidget extends StatelessWidget {
  const MaxVeMinSicaklikWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Maksimum : "+25.toString()+"C",style: TextStyle(fontSize: 20),),
        Text("Minimum : "+10.toString()+"C",style: TextStyle(fontSize: 20),),
      ],
    );
  }
}
