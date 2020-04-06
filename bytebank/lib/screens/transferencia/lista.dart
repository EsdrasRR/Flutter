import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

class ListaTranferencias extends StatefulWidget {

  final List<Tranferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTranferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
        itemCount: widget._transferencias.length,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Nova Transferência',
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Tranferencia> future = Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FormularioTransferencia()));
          future.then((transferenciaRecebida) {
            if(transferenciaRecebida != null){
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
            }
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Tranferencia _tranferencia;

  ItemTransferencia(this._tranferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_tranferencia.valor.toString()),
        subtitle: Text(_tranferencia.numeroConta.toString()),
      ),
    );
  }
}