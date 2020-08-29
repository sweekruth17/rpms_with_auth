import 'package:tt_firebase/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:tt_firebase/Shared/constants.dart';
import 'package:tt_firebase/Shared/loading.dart';
import 'package:tt_firebase/navigation/nav_home.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            //if loading is true animation is shown else not
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.amber,
              elevation: 0.0,
              title: Text('Sign In'),
              actions: <Widget>[
                FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('Register'),
                    onPressed: () {
                      widget
                          .toggleView(); // this is register button on top right
                      debugPrint("sign-in clicked");
                    })
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    TextFormField(
                        cursorColor: Colors.black,
                        decoration:
                            textInputDecoration.copyWith(hintText: "Email"),
                        validator: (val) => val.isEmpty ? 'Enter email' : null,
                        onChanged: (val) {
                          setState(
                              () => email = val); //stores the email entered
                        }),
                    SizedBox(height: 10.0),
                    TextFormField(
                        cursorColor: Colors.black,
                        decoration:
                            textInputDecoration.copyWith(hintText: "Password"),
                        obscureText: true, //to obscure the pswd
                        validator: (val) => val.length < 6
                            ? 'Enter password (6 or more characters)'
                            : null,
                        onChanged: (val) {
                          setState(
                              () => password = val); //stores the pswd entered
                        }),
                    SizedBox(height: 10.0),
                    RaisedButton(
                        color: Colors.grey,
                        child: Padding(
                            child: Text('Sign In',
                                style: TextStyle(color: Colors.white)),
                            padding: EdgeInsets.all(10.0)),
                        onPressed: () async {
                          //.
                          //add NacDrawerExample() functioin here
                          //.
                          //.
                          debugPrint("bottom sign-in button");
                          if (_formKey.currentState.validate()) {
                            //form validity check
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    '\t \t \t Error signing in \n Enter valid credentials';
                                loading = false;
                              });
                            }
                          }
                          // Navigator.of(context).push(NavDrawerExample())
                        }),
                    SizedBox(height: 10.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
