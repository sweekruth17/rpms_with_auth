import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Temperature extends StatefulWidget {
  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            actions: [],
            title: Text("Measure Your Temperature",
                style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.tealAccent));
  }
}
