import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String _infoText = "Enter your data!";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Enter your data!";
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double bmi = weight / (height * height);

      if (bmi < 18.6) {
        _infoText = "Under weight (${bmi.toStringAsPrecision(4)})";
      } else if (bmi >= 18.6 && bmi < 24.9) {
        _infoText = "Ideal weight (${bmi.toStringAsPrecision(4)})";
      } else if (bmi >= 24.9 && bmi < 29.9) {
        _infoText = "Slightly overweight (${bmi.toStringAsPrecision(4)})";
      } else if (bmi >= 29.9 && bmi < 34.9) {
        _infoText = "Obesity Grade I (${bmi.toStringAsPrecision(4)})";
      } else if (bmi >= 34.9 && bmi < 39.9) {
        _infoText = "Obesity Grade II (${bmi.toStringAsPrecision(4)})";
      } else if (bmi >= 40) {
        _infoText = "Obesity Grade III (${bmi.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person, size: 120.0, color: Colors.blueGrey),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Weight (kg)",
                  labelStyle: TextStyle(color: Colors.blueGrey)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
              controller: weightController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Height (cm)",
                  labelStyle: TextStyle(color: Colors.blueGrey)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
              controller: heightController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _calculate,
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  color: Colors.blueGrey,
                ),
              ),
            ),
            Text(
              "$_infoText",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
            )
          ],
        ),
      ),
    );
  }
}
