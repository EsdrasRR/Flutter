import 'package:alcohol_or_gasoline/widgets/input.widget.dart';
import 'package:alcohol_or_gasoline/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class SubmitForm extends StatelessWidget {
  var gasolineController = MoneyMaskedTextController();
  var alcoholController = MoneyMaskedTextController();
  var busy = false;
  Function submitFunc;

  SubmitForm({
    @required this.gasolineController,
    @required this.alcoholController,
    @required this.busy,
    @required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Gasoline",
            controller: gasolineController,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Alcohol",
            controller: alcoholController,
          ),
        ),
        SizedBox(height: 25),
        LoadingButton(
          busy: busy,
          func: submitFunc,
          text: "Calculate",
          invert: false,
        ),
      ],
    );
  }
}
