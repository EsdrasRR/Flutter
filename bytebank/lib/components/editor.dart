import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;
  final IconData _icone;

  Editor(this._controlador, this._rotulo, this._dica, this._icone);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _controlador,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          icon: _icone != null ? Icon(_icone) : null,
          labelText: _rotulo,
          hintText: _dica,
        ),
      ),
    );
  }
}