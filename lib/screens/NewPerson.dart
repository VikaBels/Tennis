// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import '../DataBase/FunctionP.dart';
import '../model/Person.dart';
import '../screens/PageTwo.dart';

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
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed(PageTwo.routeName);
          },
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              if (nameController.text != "" &&
                  departmentController.text != "") {
                await FuncPerson.instance.addPer(
                  Person(
                      //ЗДЕСЬ ПРИСВОЕНИЕ ЗНАЧЕНИЯ И ОТРАВКА В БАЗУ
                      name: nameController.text,
                      department: departmentController.text),
                );
                Navigator.of(context).pushNamed(PageTwo.routeName);
              } else
                setState(() {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding: EdgeInsets.only(top: 8),
                            height: 90,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Вы не ввели данные',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('Пожалуйста, повторите попытку'),
                                Divider(
                                  height: 1,
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.of(context)
                                        .pushNamed(NewPerson.routeName);
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
                  nameController.clear();
                  departmentController.clear();
                });
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
              padding: const EdgeInsets.only(top: 72),
              child: Text('Как зовут нового игрока?'),
            ),
            Container(
              margin: EdgeInsets.only(top: 12, bottom: 40),
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
              margin: EdgeInsets.only(top: 12),
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
