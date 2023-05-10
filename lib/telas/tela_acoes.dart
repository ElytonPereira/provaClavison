import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prova_pratica/componetes/botao.dart';
import 'package:prova_pratica/componetes/container_variaveis.dart';
import 'package:prova_pratica/componetes/texto.dart';
import 'package:prova_pratica/modelos/financas.dart';

class TelaAcoes extends StatefulWidget {
  const TelaAcoes({super.key});

  @override
  State<TelaAcoes> createState() => _TelaAcoesState();
}

class _TelaAcoesState extends State<TelaAcoes> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final financas = ModalRoute.of(context)!.settings.arguments as Financas;

    irProximo() {
      if (formKey.currentState!.validate()) {
        Navigator.pushNamed(context, '/TelaBitcoin', arguments: financas);
      }
    }

    CriaAppBar() {
      AppBar(
        title: const Text('Finanças de hoje'),
        backgroundColor: Color.fromARGB(255, 19, 87, 22),
      );
    }

    criaAppBar() {
      return AppBar(
        title: const Text('Finanças de hoje'),
        backgroundColor: Color.fromARGB(255, 19, 87, 22),
      );
    }

    criaRow1() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: const [
            Expanded(
              flex: 2,
              child: Texto(
                conteudo: 'IBOVESPA',
              ),
            ),
            Expanded(
              flex: 2,
              child: Texto(
                conteudo: 'IFIX',
              ),
            ),
          ],
        ),
      );
    }

    criaRow2() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: const [
            Expanded(
              flex: 10,
              child: Texto(
                conteudo: 'NASDAQ',
              ),
            ),
            Expanded(
              flex: 10,
              child: Texto(
                conteudo: 'DOWJONES',
              ),
            )
          ],
        ),
      );
    }

    criaRow3() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: const [
            Expanded(
              flex: 10,
              child: Texto(
                conteudo: 'CAC',
              ),
            ),
            Expanded(
              flex: 10,
              child: Texto(
                conteudo: 'NIKKEI',
              ),
            )
          ],
        ),
      );
    }

    criaRowValor1() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Texto(
              conteudo: '${financas.ibovespa}',
            ),
            containerVariaveis(
              conteudo: '${financas.ibovespaVa}',
              valor: financas.ibovespaVa,
            ),
            SizedBox(
              width: 775,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Texto(
                conteudo: '${financas.ifix}',
              ),
            ),
            containerVariaveis(
              conteudo: '${financas.ifixVa}',
              valor: financas.ifixVa,
            ),
          ],
        ),
      );
    }

    criaRowValor2() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Texto(
              conteudo: '${financas.nasdaq}',
            ),
            containerVariaveis(
              conteudo: '${financas.nasdaqVa}',
              valor: financas.nasdaqVa,
            ),
            const SizedBox(
              width: 775,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Texto(
                conteudo: '${financas.dowjones}',
              ),
            ),
            containerVariaveis(
              conteudo: '${financas.dowjonesVa}',
              valor: financas.dowjonesVa,
            ),
          ],
        ),
      );
    }

    criaRowValor3() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Texto(
              conteudo: '${financas.cac}',
            ),
            containerVariaveis(
              conteudo: '${financas.cacVa}',
              valor: financas.cacVa,
            ),
            const SizedBox(
              width: 775,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Texto(
                conteudo: '${financas.nikkei}',
              ),
            ),
            containerVariaveis(
              conteudo: '${financas.nikkeiVa}',
              valor: financas.nikkeiVa,
            ),
          ],
        ),
      );
    }

    criaContainer() {
      return Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              children: [
                criaRow1(),
                criaRowValor1(),
                criaRow2(),
                criaRowValor2(),
                criaRow3(),
                criaRowValor3()
              ],
            )),
      );
    }

    criaBody() {
      return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Texto(
                  conteudo: 'Ações',
                  tamanho: 30,
                ),
                criaContainer(),
                Botao(
                  funcaoBotao: irProximo,
                  textoBotao: 'Ir para Bitcoin',
                  corBack: Color.fromARGB(255, 19, 87, 22),
                )
              ],
            ),
          ));
    }

    return Scaffold(appBar: criaAppBar(), body: criaBody());
  }
}
