import 'package:tt_firebase/Services/auth.dart';
import 'package:tt_firebase/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt_firebase/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      //streamprovider listens to the stream
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.dark(),
        home: Wrapper(), //and wraps this mateiral app
      ),
    );
  }
}
