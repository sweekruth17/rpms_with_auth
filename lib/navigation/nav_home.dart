import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:tt_firebase/bluetooth/MainPage.dart';
import 'package:tt_firebase/bluetooth/costomicon_icons.dart';
import 'package:tt_firebase/functionality/blood_pressure.dart';
import 'package:tt_firebase/functionality/glucose.dart';
import 'package:tt_firebase/functionality/heart_rate.dart';
import 'package:tt_firebase/functionality/oxygen.dart';
import 'package:tt_firebase/functionality/temp.dart';
import '../Services/auth.dart';

// to connect to ble module
class _ble extends MaterialPageRoute<Null> {
  _ble()
      : super(builder: (BuildContext context) {
          return MainPage();
        });
}

// to come out from app
class logout extends MaterialPageRoute<Null> {
  logout()
      : super(builder: (BuildContext context) {
          return MainPage();
          // while connecting its Select calss
        });
}

// ignore: camel_case_types
//reset/update password class
class Update_password extends StatefulWidget {
  @override
  Update_passwordState createState() => Update_passwordState();
}

class Update_passwordState extends State<Update_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Reset/Update password",
                style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.tealAccent));
  }
}
//--------------------------------------------------------------------------------

//Actual home class starts from here
class NavDrawerExample extends StatelessWidget {
  void call() {}
  NavDrawerExample({Key key}) : super(key: key);
  final AuthService _auth = AuthService(); //sign_in

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    //final drawerHeader = ;
    final drawerItems = ListView(
      children: <Widget>[
        // drawerHeader,

        UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.tealAccent,
            ),
            accountName:
                Text('User Name', style: TextStyle(color: Colors.black)),
            accountEmail: Text('user.name@email.com',
                style: TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(size: 45.0),
              //add user image in place of child
              backgroundColor: Colors.white,
            )),

        ListTile(
          title: Text('Connect', style: TextStyle(color: Colors.white)),
          onTap: () {
            FlutterBluetoothSerial.instance.openSettings();
          },
          trailing: Icon(Icons.bluetooth, color: Colors.white),
        ),
        ListTile(
          title: Text('History', style: TextStyle(color: Colors.white)),
          onTap: () {},
          trailing: Icon(Icons.compare_arrows, color: Colors.white),
        ),
        ListTile(
          title: Text('Consult Doctor', style: TextStyle(color: Colors.white)),
          onTap: () {},
          trailing: Icon(FlutterIcons.doctor_mco, color: Colors.white),
        ),
        ListTile(
          title: Text('Change Password', style: TextStyle(color: Colors.white)),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => Update_password())),
          trailing: Icon(Icons.refresh, color: Colors.white),
        ),
        ListTile(
            title: Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () async {
              await _auth.signOut();
            },
            trailing:
                Icon(CommunityMaterialIcons.exit_to_app, color: Colors.white)),
        new Divider(),
        ListTile(
          title: Text('About', style: TextStyle(color: Colors.white)),
          onTap: () {},
          trailing: Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
        ),
      ],
    );
    return Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.tealAccent,
          title: Text('Welcome user!', style: TextStyle(color: Colors.black)),
          //have to add user name from auth
        ),
        body: Center(
            child: Column(children: <Widget>[
          Padding(
              child: RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Temperature()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  label: Text('Temperature',
                      style: TextStyle(color: Colors.black, fontSize: 20.0)),
                  icon: Icon(
                    MaterialCommunityIcons.thermometer,
                    size: 50.0,
                    color: Colors.black,
                  ),
                  textColor: Colors.white,
                  splashColor: Colors.white,
                  color: Colors.tealAccent),
              padding: EdgeInsets.all(15.0)),
          Padding(
              child: RaisedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Heart_rate()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                label: Text('Heart Rate',
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
                icon: Icon(
                  CupertinoIcons.heart_solid,
                  color: Colors.black,
                  size: 50.0,
                ),
                textColor: Colors.white,
                splashColor: Colors.white,
                color: Colors.tealAccent,
              ),
              padding: EdgeInsets.all(15.0)),
          Padding(
              child: RaisedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Blood_pressure()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                label: Text('Blood Pressure',
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
                icon: Icon(
                  Costomicon.blood_pressure_control_tool,
                  color: Colors.black,
                  size: 50.0,
                ),
                textColor: Colors.white,
                splashColor: Colors.white,
                color: Colors.tealAccent,
              ),
              padding: EdgeInsets.all(15.0)),
          Padding(
              child: RaisedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Oxygen()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                label: Text('Oximeter',
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
                icon: Icon(
                  Costomicon.pulse_oximeter,
                  size: 50.0,
                  color: Colors.black,
                ),
                textColor: Colors.white,
                splashColor: Colors.white,
                color: Colors.tealAccent,
              ),
              padding: EdgeInsets.all(22.0)),
          Padding(
              child: RaisedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Glucose()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                label: Text('Sugar Test',
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
                icon: Icon(
                  CommunityMaterialIcons.spoon_sugar,
                  size: 50.0,
                  color: Colors.black,
                ),
                textColor: Colors.white,
                splashColor: Colors.tealAccent,
                color: Colors.tealAccent,
              ),
              padding: EdgeInsets.all(15.0))
        ])),
        drawer: Drawer(
            child: Container(
          // theme:ThemeData.dark(),
          color: Colors.black87,
          child: drawerItems,
        )));
  }
}
