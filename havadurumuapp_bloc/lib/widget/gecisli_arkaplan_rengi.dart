import 'package:flutter/material.dart';

class GecisliArkaplanRenkContainer extends StatelessWidget {

  final Widget child;
  final MaterialColor renk;

  GecisliArkaplanRenkContainer(@required this.renk, @required this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [renk[700], renk[400], renk[200]],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.6,0.8,1]
        ),
      ),
    );
  }
}
