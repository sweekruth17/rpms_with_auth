import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Oxygen extends StatefulWidget {
  @override
  _OxygenState createState() => _OxygenState();
}

class _OxygenState extends State<Oxygen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            actions: [],
            title: Text("Oximeter", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.tealAccent));
  }
}
