import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Heart_rate extends StatefulWidget {
  @override
  _Heart_rateState createState() => _Heart_rateState();
}

class _Heart_rateState extends State<Heart_rate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            actions: [],
            title: Text("HR", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.tealAccent));
  }
}
