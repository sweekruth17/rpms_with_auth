import 'package:tt_firebase/Services/auth.dart';
import 'package:tt_firebase/navigation/nav_home.dart';
import 'package:tt_firebase/screens/Autheticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:tt_firebase/Shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.0,
        title: Text('Sign Up'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () {
                widget.toggleView();
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
                  decoration: textInputDecoration.copyWith(hintText: "Email"),
                  validator: (val) =>
                      val.isEmpty ? 'Enter email' : null, //helper text
                  onChanged: (val) {
                    setState(() => email = val); //stores the email entered
                  }),
              SizedBox(height: 10.0),
              TextFormField(
                  cursorColor: Colors.black,
                  decoration:
                      textInputDecoration.copyWith(hintText: "Password"),
                  obscureText: true, //to obscure the pswd
                  validator: (val) => val.length < 6
                      ? 'Enter password (6 or more characters)'
                      : null, //helper text
                  onChanged: (val) {
                    setState(() => password = val); //stores the pswd entered
                  }),
              SizedBox(height: 10.0),
              RaisedButton(
                  color: Colors.grey,
                  elevation: 2.0,
                  child: Padding(
                      child: Text('Register',
                          style: TextStyle(color: Colors.white)),
                      padding: EdgeInsets.all(10.0)),
                  onPressed: () async {
                    //add NacDrawerExample() functioin here
                    //.
                    //.
                    debugPrint("bottom reg button clicked");
                    if (_formKey.currentState.validate()) {
                      //form validity check
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Enter a valid email';
                          loading = false;
                        });
                      }
                    }
                    NavDrawerExample();
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
