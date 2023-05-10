import 'package:flutter/material.dart';
import 'package:prova_pratica/componetes/botao.dart';
import 'package:prova_pratica/componetes/container_variaveis.dart';
import 'package:prova_pratica/componetes/texto.dart';
import 'package:prova_pratica/modelos/financas.dart';

class TelaBitcoin extends StatefulWidget {
  const TelaBitcoin({super.key});

  @override
  State<TelaBitcoin> createState() => _TelaBitcoinState();
}

class _TelaBitcoinState extends State<TelaBitcoin> {
  @override
  Widget build(BuildContext context) {
    CriaAppBar() {
      AppBar(
        title: const Text('Finanças de hoje'),
        backgroundColor: Color.fromARGB(255, 19, 87, 22),
      );
    }

    final formKey = GlobalKey<FormState>();
    final financas = ModalRoute.of(context)!.settings.arguments as Financas;

    irProximo() {
      if (formKey.currentState!.validate()) {
        Navigator.pushNamed(context, '/TelaMoeda', arguments: financas);
      }
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
                conteudo: 'Blockchain.info',
              ),
            ),
            Expanded(
              flex: 2,
              child: Texto(
                conteudo: 'Coinbase',
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
                conteudo: 'BitStamp',
              ),
            ),
            Expanded(
              flex: 10,
              child: Texto(
                conteudo: 'FoxBit',
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
                conteudo: 'Mercado Bitcoin',
              ),
            ),
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
              conteudo: '${financas.blockchainInfo}',
            ),
            containerVariaveis(
              conteudo: '${financas.blockchainInfoVa}',
              valor: financas.blockchainInfoVa,
            ),
            const SizedBox(
              width: 775,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Texto(
                conteudo: '${financas.coinbase}',
              ),
            ),
            containerVariaveis(
              conteudo: '${financas.coinbaseVa}',
              valor: financas.coinbaseVa,
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
              conteudo: '${financas.bitStamp}',
            ),
            containerVariaveis(
              conteudo: '${financas.bitStampVa}',
              valor: financas.bitStampVa,
            ),
            const SizedBox(
              width: 775,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Texto(
                conteudo: '${financas.foxBit}',
              ),
            ),
            containerVariaveis(
              conteudo: '${financas.foxBitVa}',
              valor: financas.foxBitVa,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Texto(
                conteudo: '${financas.mercadoBitcoin}',
              ),
            ),
            containerVariaveis(
              conteudo: '${financas.mercadoBitcoinVa}',
              valor: financas.mercadoBitcoinVa,
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
                  conteudo: 'BitCoin',
                  tamanho: 30,
                ),
                criaContainer(),
                Botao(
                  funcaoBotao: irProximo,
                  textoBotao: 'Página Principal',
                  corBack: Color.fromARGB(255, 19, 87, 22),
                )
              ],
            ),
          ));
    }

    return Scaffold(appBar: criaAppBar(), body: criaBody());
  }
}
