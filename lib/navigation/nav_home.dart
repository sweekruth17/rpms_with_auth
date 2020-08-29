import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tt_firebase/bluetooth/MainPage.dart';
import 'package:tt_firebase/functionality/blood_pressure.dart';
import 'package:tt_firebase/functionality/glucose.dart';
import 'package:tt_firebase/functionality/heart_rate.dart';
import 'package:tt_firebase/functionality/oxygen.dart';
import 'package:tt_firebase/functionality/temp.dart';

import '../Services/auth.dart';

class NavDrawerExample extends StatelessWidget {
  void call() {}
  NavDrawerExample({Key key}) : super(key: key);
  final AuthService _auth = AuthService(); //sign_in

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    final drawerHeader = UserAccountsDrawerHeader(
      //arrowColor: Colors.amber,
      accountName: Text('User Name'),
      accountEmail: Text('user.name@email.com'),
      //have to add user id and name from auth
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
        backgroundColor: Colors.white,
        //we have to add functionality to add user image
        // .
        // .
        // .
        // .
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          //multiple user accounts
          child: Text('A'),
          backgroundColor: Colors.yellow,
        ),
        // CircleAvatar(
        //   child: Text('B'),
        //   backgroundColor: Colors.red,
        // )
      ],
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        // ListTile(
        //   trailing: Switch(
        //     value: isSwitched,
        //     onChanged: (value) {
        //       setState(() {
        //         isSwitched = true;
        //       });
        //     },
        //     activeTrackColor: Colors.lightGreenAccent,
        //     activeColor: Colors.green,
        //   ),
        //   title: Text('dark theme', style: TextStyle(color: Colors.amber)),
        //   onTap: () => Navigator.of(context).push(_NewPage(1)),
        // ),
        ListTile(
          title: Text('Change Password', style: TextStyle(color: Colors.white)),
          onTap: () => Navigator.of(context).push(_NewPage(2)),
          trailing: Icon(Icons.refresh, color: Colors.white),
        ),
        ListTile(
          title: Text('History', style: TextStyle(color: Colors.white)),
          onTap: () {},
          trailing: Icon(Icons.compare_arrows, color: Colors.white),
        ),
        ListTile(
          title: Text('Connect', style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.push(context, _ble());
            //MainPage();
            //  Navigator.of(context).push(
            //    MainPage());
          },
          trailing: Icon(Icons.bluetooth, color: Colors.white),
        ),
        ListTile(
            title: Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () async {
              // Navigator.of(context).push(logout());
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
          backgroundColor: Colors.amber,
          title: Text('Welcome user!', style: TextStyle(color: Colors.black)),
          //have to add user name from auth
        ),
        body: Center(
            child: Column(children: <Widget>[
          Padding(child: Heart(), padding: EdgeInsets.all(15.0)),
          Padding(child: Temperature(), padding: EdgeInsets.all(15.0)),
          Padding(child: Blood_Pressure(), padding: EdgeInsets.all(15.0)),
          Padding(child: Oxygen_Percentage(), padding: EdgeInsets.all(22.0)),
          Padding(child: Glucose(), padding: EdgeInsets.all(15.0))
        ])),
        drawer: Drawer(
            child: Container(
          // theme:ThemeData.dark(),
          color: Colors.black87,
          child: drawerItems,
        )));
  }

  void setState(Null Function() param0) {}
}

// <Null> means this route returns nothing.
class _NewPage extends MaterialPageRoute<Null> {
  _NewPage(int id)
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Page $id'),
              elevation: 1.0,
            ),
            body: Center(
              child: Text('Page $id'),
            ),
          );
        });
}

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
        });
}
