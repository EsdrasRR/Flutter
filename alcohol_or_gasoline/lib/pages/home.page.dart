import 'package:alcohol_or_gasoline/widgets/logo.widget.dart';
import 'package:alcohol_or_gasoline/widgets/submit-form.dart';
import 'package:alcohol_or_gasoline/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _gasolineController = new MoneyMaskedTextController();
  var _alcoholController = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 1200), 
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
                ? Successs(
                    reset: reset,
                    result: _resultText,
                  )
                : SubmitForm(
                    gasolineController: _gasolineController,
                    alcoholController: _alcoholController,
                    submitFunc: calculate,
                    busy: _busy,
                  ),
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double alcohol = double.parse(
            _alcoholController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double gasoline = double.parse(
            _gasolineController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double res = alcohol / gasoline;

    setState(() {
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "It pays to use gasoline!";
        } else {
          _resultText = "It pays to use alcohol!";
        }
        _color = Colors.deepPurpleAccent;
        _busy = false;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _color = Colors.deepPurple;
      _gasolineController = new MoneyMaskedTextController();
      _alcoholController = new MoneyMaskedTextController();
      _busy = false;
      _completed = false;
    });
  }
}
