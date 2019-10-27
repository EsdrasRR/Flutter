import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Otakus Accountant", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoTexto = "You may come in!";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if (_people < 0) {
        _infoTexto = "SAD ='(";
      } else if (_people < 10) {
        _infoTexto = "You may come in!";
      } else {
        _infoTexto = "How many Otakus 0.0";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/happy_loli.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Otakus: $_people",
                    style: TextStyle(
                        color: Colors.purpleAccent, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text(
                          "+1",
                          style: TextStyle(fontSize: 40.0, color: Colors.purpleAccent),
                        ),
                        onPressed: () {
                          _changePeople(1);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text(
                          "-1",
                          style: TextStyle(fontSize: 40.0, color: Colors.purpleAccent),
                        ),
                        onPressed: () {
                          _changePeople(-1);
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  "$_infoTexto",
                  style: TextStyle(
                      color: Colors.purpleAccent,
                      fontStyle: FontStyle.normal,
                      fontSize: 30),
                )
              ],
            ))
      ],
    );
  }
}
