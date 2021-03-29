import 'package:hexcolor/hexcolor.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    // return new SpinKitSquareCircle(
    //   color: Colors.red,
    //   size: 50.0,
    // );
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [HexColor('#D76D77'), HexColor('#FFAF7B')]),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
      SpinKitSquareCircle(
        color: Colors.white,
        size: 50.0,
      )
    ]));
  }
}
