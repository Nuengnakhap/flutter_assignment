import 'package:flutter/material.dart';

class MyRegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyRegisterFormState();
  }
}

class MyRegisterFormState extends State<MyRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String user;
  String pass;
  String confirmpass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('REGISTER'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
                  hintText: 'E-mail Address',
                  border: InputBorder.none,
                  fillColor: Colors.blue,
                ),
                onSaved: (value) => user = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
                  hintText: 'Password',
                  border: InputBorder.none,
                  fillColor: Colors.blue,
                ),
                obscureText: true,
                onSaved: (value) => pass = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
                  hintText: 'Confirm Password',
                  border: InputBorder.none,
                  fillColor: Colors.blue,
                ),
                obscureText: true,
                onSaved: (value) => confirmpass = value,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    _formKey.currentState.save();
                    if (user == "" || pass == "" || confirmpass == "") {
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text("กรุณาระบุข้อมูลให้ครบถ้วน")));
                    } else if (user == "admin") {
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text("User นี้มีอยู่ในระบบแล้ว")));
                    } else
                      Navigator.pop(context);
                  },
                  child: Text('CONTINUE'),
                )),
          ],
        ),
      ),
    );
  }
}
