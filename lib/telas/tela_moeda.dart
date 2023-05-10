import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prova_pratica/componetes/botao.dart';
import 'package:prova_pratica/componetes/container_variaveis.dart';
import 'package:prova_pratica/componetes/texto.dart';
import 'package:prova_pratica/modelos/financas.dart';

class TelaMoeda extends StatefulWidget {
  const TelaMoeda({super.key});

  @override
  State<TelaMoeda> createState() => _TelaMoedaState();
}

class _TelaMoedaState extends State<TelaMoeda> {
  double dolar = 0.0;
  double dolarVa = 0.0;
  double euro = 0.0;
  double euroVa = 0.0;
  double yen = 0.0;
  double yenVa = 0.0;
  double peso = 0.0;
  double pesoVa = 0.0;

  double ibovespa = 0.0;
  double ibovespaVa = 0.0;
  double ifix = 0.0;
  double ifixVa = 0.0;
  double nasdaq = 0.0;
  double nasdaqVa = 0.0;
  double dowjones = 0.0;
  double dowjonesVa = 0.0;
  double cac = 0.0;
  double cacVa = 0.0;
  double nikkei = 0.0;
  double nikkeiVa = 0.0;

  double blockchainInfo = 0.0;
  double blockchainInfoVa = 0.0;
  double coinbase = 0.0;
  double coinbaseVa = 0.0;
  double bitStamp = 0.0;
  double bitStampVa = 0.0;
  double foxBit = 0.0;
  double foxBitVa = 0.0;
  double mercadoBitcoin = 0.0;
  double mercadoBitcoinVa = 0.0;
  Financas financas = Financas(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

  @override
  void initState() {
    super.initState();
    calculaMoeda();
  }

  calculaMoeda() async {
    final String urlApiFinance =
        'https://api.hgbrasil.com/finance?format=json-cors&key=e9365153';
    Response resposta = await get(Uri.parse(urlApiFinance));
    Map valores = json.decode(resposta.body);

    //                      Valores compra

    dolar = double.parse('${valores['results']['currencies']['USD']['buy']}');
    euro = double.parse('${valores['results']['currencies']['EUR']['buy']}');
    peso = double.parse('${valores['results']['currencies']['ARS']['buy']}');
    yen = double.parse('${valores['results']['currencies']['JPY']['buy']}');

    dolar = double.parse(dolar.toStringAsFixed(4));
    euro = double.parse(euro.toStringAsFixed(4));
    peso = double.parse(peso.toStringAsFixed(4));
    yen = double.parse(yen.toStringAsFixed(4));

    ibovespa =
        double.parse('${valores['results']['stocks']['IBOVESPA']['points']}');
    ifix = double.parse('${valores['results']['stocks']['IFIX']['points']}');
    nasdaq =
        double.parse('${valores['results']['stocks']['NASDAQ']['points']}');
    dowjones =
        double.parse('${valores['results']['stocks']['DOWJONES']['points']}');
    cac = double.parse('${valores['results']['stocks']['CAC']['points']}');
    nikkei =
        double.parse('${valores['results']['stocks']['NIKKEI']['points']}');

    ibovespa = double.parse(ibovespa.toStringAsFixed(2));
    ifix = double.parse(ifix.toStringAsFixed(2));
    nasdaq = double.parse(nasdaq.toStringAsFixed(2));
    dowjones = double.parse(dowjones.toStringAsFixed(2));
    cac = double.parse(cac.toStringAsFixed(2));
    nikkei = double.parse(nikkei.toStringAsFixed(2));

    blockchainInfo = double.parse(
        '${valores['results']['bitcoin']['blockchain_info']['buy']}');
    coinbase =
        double.parse('${valores['results']['bitcoin']['coinbase']['last']}');
    bitStamp =
        double.parse('${valores['results']['bitcoin']['bitstamp']['buy']}');
    foxBit = double.parse('${valores['results']['bitcoin']['foxbit']['last']}');
    mercadoBitcoin = double.parse(
        '${valores['results']['bitcoin']['mercadobitcoin']['buy']}');

    blockchainInfo = double.parse(blockchainInfo.toStringAsFixed(2));
    coinbase = double.parse(coinbase.toStringAsFixed(2));
    bitStamp = double.parse(bitStamp.toStringAsFixed(2));
    foxBit = double.parse(foxBit.toStringAsFixed(2));
    mercadoBitcoin = double.parse(mercadoBitcoin.toStringAsFixed(2));

    //                        VALORES VARIAVES

    //                MOEDAS

    dolarVa =
        double.parse('${valores['results']['currencies']['USD']['variation']}');
    euroVa =
        double.parse('${valores['results']['currencies']['EUR']['variation']}');
    pesoVa =
        double.parse('${valores['results']['currencies']['ARS']['variation']}');
    yenVa =
        double.parse('${valores['results']['currencies']['JPY']['variation']}');

    dolarVa = double.parse(dolarVa.toStringAsFixed(4));
    euroVa = double.parse(euroVa.toStringAsFixed(4));
    pesoVa = double.parse(pesoVa.toStringAsFixed(4));
    yenVa = double.parse(yenVa.toStringAsFixed(4));

    //                AÇÕES

    ibovespaVa = double.parse(
        '${valores['results']['stocks']['IBOVESPA']['variation']}');
    ifixVa =
        double.parse('${valores['results']['stocks']['IFIX']['variation']}');
    nasdaqVa =
        double.parse('${valores['results']['stocks']['NASDAQ']['variation']}');
    dowjonesVa = double.parse(
        '${valores['results']['stocks']['DOWJONES']['variation']}');
    cacVa = double.parse('${valores['results']['stocks']['CAC']['variation']}');
    nikkeiVa =
        double.parse('${valores['results']['stocks']['NIKKEI']['variation']}');

    ibovespaVa = double.parse(ibovespaVa.toStringAsFixed(2));
    ifixVa = double.parse(ifixVa.toStringAsFixed(2));
    nasdaqVa = double.parse(nasdaqVa.toStringAsFixed(2));
    dowjonesVa = double.parse(dowjonesVa.toStringAsFixed(2));
    cacVa = double.parse(cacVa.toStringAsFixed(2));
    nikkeiVa = double.parse(nikkeiVa.toStringAsFixed(2));

    //                BITCOIN

    blockchainInfoVa = double.parse(
        '${valores['results']['bitcoin']['blockchain_info']['variation']}');
    coinbaseVa = double.parse(
        '${valores['results']['bitcoin']['coinbase']['variation']}');
    bitStampVa = double.parse(
        '${valores['results']['bitcoin']['bitstamp']['variation']}');
    foxBitVa =
        double.parse('${valores['results']['bitcoin']['foxbit']['variation']}');
    mercadoBitcoinVa = double.parse(
        '${valores['results']['bitcoin']['mercadobitcoin']['variation']}');

    blockchainInfoVa = double.parse(blockchainInfoVa.toStringAsFixed(3));
    coinbaseVa = double.parse(coinbaseVa.toStringAsFixed(3));
    bitStampVa = double.parse(bitStampVa.toStringAsFixed(3));
    foxBitVa = double.parse(foxBitVa.toStringAsFixed(3));
    mercadoBitcoinVa = double.parse(mercadoBitcoinVa.toStringAsFixed(3));

    financas = Financas(
        dolar,
        dolarVa,
        euro,
        euroVa,
        peso,
        pesoVa,
        yen,
        yenVa,
        ibovespa,
        ibovespaVa,
        ifix,
        ifixVa,
        nasdaq,
        nasdaqVa,
        dowjones,
        dowjonesVa,
        cac,
        cacVa,
        nikkei,
        nikkeiVa,
        blockchainInfo,
        blockchainInfoVa,
        coinbase,
        coinbaseVa,
        bitStamp,
        bitStampVa,
        foxBit,
        foxBitVa,
        mercadoBitcoin,
        mercadoBitcoinVa);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //calculaMoeda();
    final formKey = GlobalKey<FormState>();

    irProximo() {
      if (formKey.currentState!.validate()) {
        Navigator.pushNamed(context, '/TelaAcoes', arguments: financas);
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
                conteudo: 'Dólar',
              ),
            ),
            Expanded(
              flex: 2,
              child: Texto(
                conteudo: 'Euro',
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
                conteudo: 'Peso',
              ),
            ),
            Expanded(
              flex: 10,
              child: Texto(
                conteudo: 'Yen',
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
              conteudo: '${financas.dolar}',
            ),
            containerVariaveis(
              conteudo: '${financas.dolarVa}',
              valor: financas.dolarVa,
            ),
            SizedBox(
              width: 775,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Texto(
                conteudo: '${financas.euro}',
              ),
            ),
            containerVariaveis(
              conteudo: '${financas.euroVa}',
              valor: financas.euroVa,
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
              conteudo: '${financas.peso}',
            ),
            containerVariaveis(
              conteudo: '${financas.pesoVa}',
              valor: financas.pesoVa,
            ),
            const SizedBox(
              width: 775,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Texto(
                conteudo: '${financas.yen}',
              ),
            ),
            containerVariaveis(
              conteudo: '${financas.yenVa}',
              valor: financas.yenVa,
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
                criaRowValor2()
              ],
            )),
      );
    }

    criaBody() {
      return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Texto(
                  conteudo: 'MOEDAS',
                  tamanho: 30,
                ),
                criaContainer(),
                Botao(
                  funcaoBotao: irProximo,
                  textoBotao: 'Ir para ações',
                  corBack: Color.fromARGB(255, 19, 87, 22),
                )
              ],
            ),
          ));
    }

    return Scaffold(appBar: criaAppBar(), body: criaBody());
  }
}
