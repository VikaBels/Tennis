// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:table_tennis/DataBase/FunctionP.dart';
import 'package:table_tennis/model/Person.dart';
import 'package:table_tennis/screens/PageTwo.dart';

class NewPerson extends StatefulWidget {
  const NewPerson({Key? key}) : super(key: key);
  static const routeName = '/newPers';

  @override
  State<NewPerson> createState() => _NewPersonState();
}

class _NewPersonState extends State<NewPerson> {
  final nameController = TextEditingController();
  final departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              await FuncPerson.instance.addPer(
                Person(
                    //ЗДЕСЬ ПРИСВОЕНИЕ ЗНАЧЕНИЯ И ОТРАВКА В БАЗУ
                    name: nameController.text,
                    department: departmentController.text),
              );
              setState(() {
                nameController.clear();
                departmentController.clear();
              });

              Navigator.of(context).pushNamed(PageTwo.routeName);
            },
            child: Text(
              'Готово',
              style: TextStyle(
                backgroundColor: Theme.of(context).primaryColor,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Text('Как зовут нового игрока?'),
            ),
            Container(
              margin: EdgeInsets.only(top: 13, bottom: 40),
              height: 30,
              width: 170,
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Text('В каком отделе он работает?'),
            Container(
              margin: EdgeInsets.only(top: 13),
              height: 30,
              width: 170,
              child: TextFormField(
                controller: departmentController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
