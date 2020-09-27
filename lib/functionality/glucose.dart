import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Glucose extends StatefulWidget {
  @override
  _GlucoseState createState() => _GlucoseState();
}

class _GlucoseState extends State<Glucose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          actions: [],
          title: Text("Sugar level", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.tealAccent),
    );
  }
}
