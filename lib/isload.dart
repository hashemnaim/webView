import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IsLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:   SpinKitWanderingCubes(
  color: Colors.blue,
  size: 30.0,
      )
    );
  }
}
