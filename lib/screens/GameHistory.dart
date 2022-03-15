// ignore_for_file: prefer_final_fields, prefer_const_literals_to_create_immutables, file_names, prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import '../DataBase/FunctionM.dart';
import '../screens/PageOne.dart';

import '../model/Match.dart';

//https://www.youtube.com/watch?v=noi6aYsP7Go&t=438s
// ОЧ ВАЖНОЕ
class GameHistory extends StatefulWidget {
  const GameHistory({Key? key}) : super(key: key);
  static const routeName = '/GameHistory';

  @override
  _GameHistoryState createState() => _GameHistoryState();
}

class _GameHistoryState extends State<GameHistory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushNamed(PageOne.routeName);
            },
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Match>>(
              future: FuncMatch.instance.getMatchs(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Match>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Loading...'));
                }
                return snapshot.data!.isEmpty
                    ? Center(
                        child: Text('No Persons in List.'),
                      )
                    : ListView(
                        children: snapshot.data!.map((match) {
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 19, top: 9),
                                child: Text(
                                  match.time,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                      //'${person.id_one}',
                                      'Per 1'),
                                  Text(
                                      '${match.point_one}  -  ${match.point_two}'),
                                  Text(
                                      //'${person.id_two}',
                                      'Per 2'),
                                ],
                              ),
                              Divider(
                                color: Colors.grey[300],
                                height: 18,
                                thickness: 1,
                                indent: 15,
                                endIndent: 15,
                              ),
                            ],
                          );
                        }).toList(),
                      );
              }),
        ),
      ),
    );
  }
}

 


 /*String _timeString =
      DateFormat('yyyy-dd-MM  kk:mm').format(DateTime.now()).toString();

  int? selectedId;
  final nameController = TextEditingController();
  final departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              TextField(
                controller: nameController,
              ),
              TextField(
                controller: departmentController,
              ),
            ],
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Person>>(
              future: FuncPerson.instance.getPersons(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Loading...'));
                }
                return snapshot.data!.isEmpty
                    ? Center(
                        child: Text('No Persons in List.'),
                      )
                    : ListView(
                        children: snapshot.data!.map((person) {
                          return Center(
                            child: Card(
                              color: selectedId == person.id
                                  ? Colors.white70
                                  : Colors.white,
                              child: ListTile(
                                title: Text(person.name),
                                //////////////////////////////
                                /*title: Text(grocery.name == 'e'
                                    ? grocery.name
                                    : grocery.department),*/
                                subtitle: Text(person.department),
                                onTap: () {
                                  setState(() {
                                    if (selectedId == null) {
                                      nameController.text = person.name;
                                      departmentController.text =
                                          person.department;
                                      selectedId = person.id;
                                    } else {
                                      nameController.text = '';
                                      departmentController.text = '';
                                      selectedId = null;
                                    }
                                  });
                                },
                                onLongPress: () {
                                  setState(() {
                                    FuncPerson.instance.removePer(person.id!);
                                  });
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            selectedId != null
                ? await FuncPerson.instance.updatePer(
                    Person(
                        id: selectedId,
                        name: nameController.text,
                        department: departmentController.text),
                  )
                : await FuncPerson.instance.addPer(
                    Person(
                        //ЗДЕСЬ ПРИСВОЕНИЕ ЗНАЧЕНИЯ И ОТРАВКА В БАЗУ
                        name: nameController.text,
                        department: departmentController.text),
                  );
            setState(() {
              nameController.clear();
              departmentController.clear();
              selectedId == null;
            });
          },
          child: Icon(Icons.save),
        ),
      ),
    );
  }*/


