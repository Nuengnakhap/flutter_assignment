import 'package:flutter/material.dart';

class MyLoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyLoginFormState();
  }
}

class MyLoginFormState extends State<MyLoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String user;
  String pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
          children: <Widget>[
            Image.asset(
              'resources/Tulips.jpg',
              height: 200,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'User Id',
                  border: InputBorder.none,
                ),
                onSaved: (value) => user = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Password',
                  border: InputBorder.none,
                ),
                obscureText: true,
                onSaved: (value) => pass = value,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  onPressed: () {
                    _formKey.currentState.save();
                    if (user == "" || pass == "") {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("กรุณาระบุ user or password")));
                    } else if (user == "admin" && pass == "admin") {
                      Navigator.pushNamed(context, "/home");
                    } else {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("user or password ไม่ถูกต้อง")));
                    }
                  },
                  child: Text('LOGIN'),
                )),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Text('Register New Account',
                    style: TextStyle(
                      color: Colors.green,
                    )),
                onPressed: () {
                  Navigator.pushNamed(context, "/register");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
