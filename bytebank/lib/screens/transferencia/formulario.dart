import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criar Transferência';

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controllerCampoNumeroConta = TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  _FormularioTransferenciaState createState() => _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(widget._controllerCampoNumeroConta, 'Número da conta', '000', null),
            Editor(widget._controllerCampoValor, 'Valor', '0,00', Icons.monetization_on),
            RaisedButton(
              child: Text(_tituloAppBar),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(widget._controllerCampoNumeroConta.text);
    final double valor = double.tryParse(widget._controllerCampoValor.text);
    if (numeroConta != null && valor != null) {
      final tranferenciaCriada = Tranferencia(valor, numeroConta);
      Navigator.pop(context, tranferenciaCriada);
    }
  }
}