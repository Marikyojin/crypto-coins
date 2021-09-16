import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:crypto_coins/componets/logo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String id = "";

  String _logoBTC =
      "https://assets.coingecko.com/coins/images/1/large/bitcoin.png";
  String _btc = "Bitcoin";
  String _logoETH =
      "https://assets.coingecko.com/coins/images/279/large/ethereum.png";
  String _eth = "Ethereum";
  String _logoLTC =
      "https://assets.coingecko.com/coins/images/2/large/litecoin.png";

  String _ltc = "Litecoin";
  String _logoXRP =
      "https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png";

  String _xrp = "Ripple";

  String _baseURL = "https://api.coingecko.com/api/v3/simple/";

  _atualizarBTC() async {
    id = "bitcoin";
    http.Response response;

    response =
        await http.get(Uri.parse(_baseURL + "price?ids=$id&vs_currencies=brl"));
    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _btc = "R\$ " + retorno["bitcoin"]["brl"].toString();
    });
  }

  _atualizarETH() async {
    id = "ethereum";

    http.Response response;

    response =
        await http.get(Uri.parse(_baseURL + "price?ids=$id&vs_currencies=brl"));
    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _eth = "R\$ " + retorno["ethereum"]["brl"].toString();
    });
  }

  _atualizarXRP() async {
    id = "ripple";

    http.Response response;

    response =
        await http.get(Uri.parse(_baseURL + "price?ids=$id&vs_currencies=brl"));
    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _xrp = "R\$ " + retorno["ripple"]["brl"].toString();
    });
  }

  _atualizarLTC() async {
    id = "litecoin";
    http.Response response;

    response =
        await http.get(Uri.parse(_baseURL + "price?ids=$id&vs_currencies=brl"));
    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _ltc = "R\$ " + retorno["litecoin"]["brl"].toString();
    });
  }

  _atualizar() {
    _atualizarBTC();
    _atualizarETH();
    _atualizarLTC();
    _atualizarXRP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000d2d),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Logo(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                _logoBTC,
                                height: 55,
                              ),
                              Text(
                                _btc,
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xFFE2A50E)),
                              ),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              _logoETH,
                              height: 55,
                            ),
                            Text(
                              _eth,
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFFE2A50E)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              _logoXRP,
                              height: 55,
                            ),
                            Text(
                              _xrp,
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFFE2A50E)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              _logoLTC,
                              height: 55,
                            ),
                            Text(
                              _ltc,
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFFE2A50E)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _atualizar();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE2A50E),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(
                      "Atualizar",
                      style: TextStyle(color: Color(0xFF000d2d), fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
