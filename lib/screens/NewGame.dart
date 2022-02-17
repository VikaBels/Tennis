// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unnecessary_new

import 'package:flutter/material.dart';

import 'package:table_tennis/main.dart';
import 'package:table_tennis/screens/PageOne.dart';
import 'package:table_tennis/widgets/ListNumbers.dart';

class NewGame extends StatefulWidget {
  const NewGame({Key? key}) : super(key: key);

  static const routeName = '/newGame';

  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  int _counterOne = 0;
  int _counterTwo = 0;
  int _counterClick = 0;

  int _count = 1;

  void _incrementCounterOne() {
    setState(() {
      _counterOne++;
      _counterClick++;

      if (_counterOne == 2) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: EdgeInsets.only(top: 7),
                  height: 90,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Игра окончена',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Игра окончена. Счёт $_counterOne-$_counterTwo'),
                      Divider(
                        height: 1,
                      ),
                      TextButton(
                        style: ButtonStyle(),
                        onPressed: () {
                          Navigator.of(context).pushNamed(PageOne.routeName);
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      }
      //
      _count = _count + 1;
    });
  }

  // https://question-it.com/questions/967077/vsplyvajuschee-dialogovoe-okno-pri-nazhatii-knopki-vo-flattere

  void _incrementCounterTwo() {
    setState(() {
      _counterTwo++;
      _counterClick++;

      if (_counterTwo == 2) {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: EdgeInsets.only(top: 7),
                  height: 90,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Игра окончена',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Игра окончена. Счёт $_counterOne-$_counterTwo'),
                      Divider(
                        height: 1,
                      ),
                      TextButton(
                        style: ButtonStyle(),
                        onPressed: null,
                        child: Text(
                          'OK',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      }

      //
      _count = _count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _contatos = List.generate(
        _count,
        (int i) => ListNumbers(
              kolOne: _counterOne,
              kolTwo: _counterTwo,
            ));

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Nastya',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Vika',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _counterClick % 2 == 0
                  ? Icon(Icons.circle)
                  : Icon(Icons.circle_outlined),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: _incrementCounterOne,
                child: Text(
                  '$_counterOne',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 65,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Text(
                ':',
                style: TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(width: 12),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: _incrementCounterTwo,
                child: Text(
                  '$_counterTwo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 65,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              _counterClick % 2 == 0
                  ? Icon(Icons.circle_outlined)
                  : Icon(Icons.circle),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 300.0,
            child: new ListView(
              children: _contatos,
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }
}
