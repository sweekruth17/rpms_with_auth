import 'package:tt_firebase/navigation/nav_home.dart';
import 'package:tt_firebase/screens/Autheticate/authenticate.dart';
//import 'package:tt_firebase/screens/Home/home.dart'; removed from shishir's code
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_firebase/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //return either home or auth widget
    if (user == null) {
      return Authenticate();
    } else {
      return NavDrawerExample();
    }
  }
}
