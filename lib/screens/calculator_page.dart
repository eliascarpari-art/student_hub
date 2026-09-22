import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/menu_drawer.dart';

class CalculatorPage extends StatefulWidget {
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  dynamic _result = 0;



  final TextEditingController _controller = TextEditingController();

  void _adicionarValor(String valor) {
    setState(() {
      _controller.text = _controller.text + valor;
    });
  }

  String numero = "";
  String resultado = "";
  void _calcular() {
    try {
      String conta = _controller.text;

      if (conta.contains("+")) {
        var partes = conta.split("+");

        double n1 = double.parse(partes[0]);
        double n2 = double.parse(partes[1]);

        setState(() {
          _result = n1 + n2;
        });
      }

      if (conta.contains("-")) {
        var partes = conta.split("-");

        double n1 = double.parse(partes[0]);
        double n2 = double.parse(partes[1]);

        setState(() {
          _result = n1 - n2;
        });
      }

      if (conta.contains("x")) {
        var partes = conta.split("x");

        double n1 = double.parse(partes[0]);
        double n2 = double.parse(partes[1]);

        setState(() {
          _result = n1 * n2;
        });
      }

      if (conta.contains("÷")) {
        var partes = conta.split("÷");

        double n1 = double.parse(partes[0]);
        double n2 = double.parse(partes[1]);

        if(n2 == 0)
        {
            _result ='Não existe divisão por zero';
            return;
        }

        setState(() {
          _result = n1 / n2;
        });
      }

    } catch (e) {
      setState(() {
        _result = 0;
      });
    }
  }



  void _limpar() {
    setState(() {
      _controller.text = '';
      _result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Calculadora'),
      ),

      drawer: MenuDrawer(),


      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20,left: 80,right: 80,bottom: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('1'),
                    child: Text('1')
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('2'),
                    child: Text('2')
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('3'),
                    child: Text('3')
                ),
              ],
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('4'),
                    child: Text('4')
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('5'),
                    child: Text('5')
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('6'),
                    child: Text('6')
                ),
              ],
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('7'),
                    child: Text('7')
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('8'),
                    child: Text('8')
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('9'),
                    child: Text('9')
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('0'),
                    child: Text('0')
                ),

              ],
            ),



























            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('+'),
                    child: Text('+')
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('-'),
                    child: Text('-')
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('x'),
                    child: Text('x')
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _adicionarValor('÷'),
                    child: Text('÷')
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () => _calcular(),
                    child: Text('=')
                ),
              ],
            ),



            const SizedBox(height: 40),
            const Text('Resultado'),
            Text(
              '$_result',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 20
                        ),
                        backgroundColor: Colors.red
                    ),
                    onPressed: (){
                      _limpar();
                    },
                    child: Text('Limpar')
                ),

              ],
            ),

          ],
        ),



      ),


    );
  }
}