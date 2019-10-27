import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "People Accountant",
      home: Stack(
        children: <Widget>[
          Image.asset(
            "images/new_game.jpg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Pessoas: 0",
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
                        style: TextStyle(
                            fontSize: 40.0, color: Colors.purpleAccent),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(
                            fontSize: 40.0, color: Colors.purpleAccent),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Text(
                "Pode Entrar!",
                style: TextStyle(
                    color: Colors.purpleAccent,
                    fontStyle: FontStyle.italic,
                    fontSize: 30),
              )
            ],
          )
        ],
      )));
}
