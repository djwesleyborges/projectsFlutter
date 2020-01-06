import 'package:flutter/material.dart';

void main() {
  /*Chamamos a função runApp
  * apos isso, temos que passar um widget como parametro (MaterialApp)
  * e um titulo e um (home) que sera a tela inicial.*/
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
}
// Stateful permite que os widgets da tela mudem
// Stateles não permite mudança dos widgets
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _changePeople(int delta){
    setState(() { // setState Atualiza a tela, alterando o valor
      _people += delta;
      if(_people < 0){
        setState(() {
          _infoText = "Mundo Invertido";
        });
      }
      else if(_people <= 10){
        _infoText = "Pode Entrar!";
      }
      else{
        _infoText = "Lotado";
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack( // Widget para colocar imagem de fundo
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          // mainAxisAlignment Alinha todos Widgets da coluna no centro da tela
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              // Linha dos botoes +1 e -1
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza a linha
              children: <Widget>[
                Padding(
                  // EdgeInsets.all espaço igual em todos lados
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    // Botão +1
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {_changePeople(1);},
                  ),
                ),
                Padding(
                  // EdgeInsets.all espaço igual em todos lados
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    // Botão +1
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {_changePeople(-1);},
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        ),
      ],
    );
  }
}
