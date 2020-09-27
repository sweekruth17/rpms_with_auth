import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:tt_firebase/bluetooth/costomicon_icons.dart';

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}

class Blood_pressure extends StatefulWidget {
  @override
  _Blood_pressureState createState() => _Blood_pressureState();
}

class _Blood_pressureState extends State<Blood_pressure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title:
                Text("Blood Pressure", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.tealAccent));
  }
}
