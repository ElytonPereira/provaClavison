import 'package:flutter/material.dart';
import 'package:prova_pratica/componetes/texto.dart';

class containerVariaveis extends StatefulWidget {
  containerVariaveis({super.key, this.valor, this.conteudo});
  final valor;
  final conteudo;

  @override
  State<containerVariaveis> createState() => _containerVariaveisState();
}

class _containerVariaveisState extends State<containerVariaveis> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 70,
        height: 30,
        decoration: BoxDecoration(
          color: widget.valor < 0 ? Colors.red : Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Texto(
            conteudo: widget.conteudo,
            cor: Colors.white,
          ),
        ),
      ),
    );
  }
}
