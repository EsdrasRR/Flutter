import 'package:alcohol_or_gasoline/widgets/input.widget.dart';
import 'package:alcohol_or_gasoline/widgets/logo.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alcohol or Gasoline',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var _gasController = new MoneyMaskedTextController();
  var _alcController = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Input(label: "Gasoline", controller: _gasController),
          Input(label: "Alcohol", controller: _alcController),
          Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(60)),
            height: 50,
            child: FlatButton(
              child: Text(
                "CALCULATE",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                    fontFamily: "Big Shoulders Display"),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
