import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=41df91f0";

void main() async {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dollarController = TextEditingController();
  final euroController = TextEditingController();
  final poundController = TextEditingController();
  final pesoController = TextEditingController();

  double dollar;
  double euro;
  double pound;
  double peso;

  void _clearAll() {
    realController.text = "";
    dollarController.text = "";
    euroController.text = "";
    pesoController.text = "";
    poundController.text ="";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dollarController.text = (real / dollar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
    poundController.text = (real / pound).toStringAsFixed(2);
    pesoController.text = (real / peso).toStringAsFixed(2);
    
  }

  void _dollarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dollar = double.parse(text);
    realController.text = (dollar * this.dollar).toStringAsFixed(2);
    euroController.text = (dollar * this.dollar / euro).toStringAsFixed(2);
    poundController.text = (dollar * this.dollar / pound).toStringAsFixed(2);
    pesoController.text = (dollar * this.dollar / peso).toStringAsFixed(2);

  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dollarController.text = (euro * this.euro / dollar).toStringAsFixed(2);
    poundController.text = (euro * this.euro / pound).toStringAsFixed(2);
    pesoController.text = (euro * this.euro / peso).toStringAsFixed(2);
  }

  void _poundChanged(String text){
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double pound = double.parse(text);
    realController.text = (pound * this.pound).toStringAsFixed(2);
    dollarController.text = (pound * this.pound / dollar).toStringAsFixed(2);
    pesoController.text = (pound * this.pound / peso).toStringAsFixed(2);
    euroController.text = (pound * this.pound / euro).toStringAsFixed(2);
  }

  void _pesoChanged(String text){
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double peso = double.parse(text);
    realController.text = (peso * this.peso).toStringAsFixed(2);
    dollarController.text = (peso * this.peso / dollar).toStringAsFixed(2);
    poundController.text = (peso * this.peso / pound).toStringAsFixed(2);
    euroController.text = (peso * this.peso / euro).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Converter \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text("Loading data...",
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                    textAlign: TextAlign.center),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error loading data :(",
                      style: TextStyle(color: Colors.amber, fontSize: 25),
                      textAlign: TextAlign.center),
                );
              } else {
                dollar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                pound = snapshot.data["results"]["currencies"]["GBP"]["buy"];
                peso = snapshot.data["results"]["currencies"]["ARS"]["buy"];

                return SingleChildScrollView(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(Icons.monetization_on,
                          size: 150, color: Colors.amber),
                      Divider(),
                      buildTextField(
                          "Reais", "R\$ ", realController, _realChanged),
                      Divider(),
                      buildTextField(
                          "Dollars", "US\$ ", dollarController, _dollarChanged),
                      Divider(),
                      buildTextField("Euros", "€ ", euroController, _euroChanged),
                      Divider(),
                      buildTextField("Pound Sterling", "£ ", poundController, _poundChanged),
                      Divider(),
                      buildTextField("Argentine Peso", "\$ ", pesoController, _pesoChanged)
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  print(json.decode(response.body));
  return json.decode(response.body);
}

Widget buildTextField(String label, String prefix,
    TextEditingController controller, Function changeFunction) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(),
      prefixText: prefix,
      prefixStyle: TextStyle(color: Colors.amber),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber),
      ),
    ),
    style: TextStyle(color: Colors.amber, fontSize: 25),
    onChanged: changeFunction,
  );
}
