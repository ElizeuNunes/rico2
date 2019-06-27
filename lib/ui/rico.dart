
import 'package:flutter/material.dart';
import "dart:math";
import 'dart:io';


class Rico extends StatefulWidget {
  @override
  _RicoState createState() => _RicoState();
}

//classe interna do tipo State e que recebe a class Rico
class _RicoState extends State<Rico> {

  double _contador = 6;

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Game Over"),
          content: Text("Você Perdeu Tudo - Tente outra vez"),
          actions: <Widget>[
            new FlatButton(onPressed: ()=> exit(0),
              child: Text("Fechar"),
            ),
          ],
        );
      },
    );
  }//ShowDialog




  void _maisGrana()
  {
    setState(() {
      Random sorteio = new Random();

      int min = 1;
      int max = 6;
      int r = min + sorteio.nextInt(max - min);

      if(r == 2)
      {
        _contador = _contador +9;
        print(r);
      }
      else if(r == 5)
      {
          _contador = _contador - 10;
          print(r);
      }
      else if(r == 6)
      {
          _contador = _contador / 2;
          print(r);
      }
      if(_contador <=0){
        _showDialog();
        _contador = 10;
      }




    });


  }






  @override
  Widget build(BuildContext context) {
    //Cria a tela(ui)
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("\$ Rico App \$")),
        backgroundColor: Colors.lightBlue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: <Widget>[
              //título do App
              Expanded(
                child: Center(
                  child: Text("Venha Ficar Rico!!!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.lightBlue,
                  ),
                ),
                ),
              ),

              //valor em dinheiro
              Expanded(
                child: Center(
                  child: Text("R\$  $_contador",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: _contador >= 150 ? Colors.red : Colors.green,



                    ),
                  ),
                ),
              ),

              //Botão de Ação
              Expanded(
                child: Center(
                  child: FlatButton(
                      onPressed: _maisGrana,
                      color: Colors.blueAccent,
                      textColor: Colors.white,

                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text("Mais Grana!!!!",
                        style: TextStyle(
                          fontSize: 30
                        ),
                        ),
                      ),
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }

}
