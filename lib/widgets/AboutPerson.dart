// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:table_tennis/DataBase/FunctionP.dart';
import 'package:table_tennis/model/Department.dart';
import 'package:table_tennis/model/Person.dart';

class AboutPerson extends StatefulWidget {
  final int number;
  AboutPerson(this.number);

  @override
  State<AboutPerson> createState() => _AboutPersonState();
}

class _AboutPersonState extends State<AboutPerson> {
  int? selectedId;
  final nameController = TextEditingController();
  final departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text('${widget.number}'),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Text('Отдел'),
            ),
            Container(
              height: 28,
              width: 130,
              child: TextField(
                  controller: departmentController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          child: Center(
                            child: FutureBuilder<List<Department>>(
                                //ВЫБОРКА ПО ID
                                //https://translated.turbopages.org/proxy_u/en-ru.ru.caf945b2-6202ae2c-8f4a77d5-74722d776562/https/stackoverflow.com/questions/59765563/get-all-records-with-same-column-value-in-an-sqlite-db-table-using-moor-flutter
                                future: FuncPerson.instance.getDepartment(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Department>> snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(child: Text('Loading...'));
                                  }
                                  return snapshot.data!.isEmpty
                                      ? Center(
                                          child:
                                              Text('No Departments in List.'),
                                        )
                                      : ListView(
                                          children: snapshot.data!.map((dep) {
                                            return Center(
                                              child: Card(
                                                child: ListTile(
                                                  title: Text(dep.department),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      if (selectedId == null) {
                                                        departmentController
                                                                .text =
                                                            dep.department;
                                                        selectedId = dep.id;
                                                      } else {
                                                        nameController.text =
                                                            '';
                                                        departmentController
                                                            .text = '';
                                                        selectedId = null;
                                                      }
                                                    });
                                                  },
                                                  onLongPress: () async {},
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        );
                                }),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Text('Имя'),
            ),
            Container(
              height: 28,
              width: 130,
              child: TextField(
                  controller: nameController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          child: Center(
                            child: FutureBuilder<List<Person>>(
                                future: departmentController.text != ''
                                    ? FuncPerson.instance.getPersonsByName(
                                        departmentController.text)
                                    : FuncPerson.instance.getPersons(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Person>> snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(child: Text('Loading...'));
                                  }
                                  return snapshot.data!.isEmpty
                                      ? Center(
                                          child: Text('No Persons in List.'),
                                        )
                                      : ListView(
                                          children:
                                              snapshot.data!.map((person) {
                                            return Center(
                                              child: Card(
                                                child: ListTile(
                                                  title: Text(person.name),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      if (selectedId == null) {
                                                        nameController.text =
                                                            person.name;
                                                        departmentController
                                                                .text =
                                                            person.department;
                                                        selectedId = person.id;
                                                      } else {
                                                        nameController.text =
                                                            '';
                                                        departmentController
                                                            .text = '';
                                                        selectedId = null;
                                                      }
                                                    });
                                                  },
                                                  onLongPress: () {},
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        );
                                }),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ],
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(width: 20, color: Colors.grey.shade300),
  );
}


 /* showModalBottomSheet(
                      barrierColor: Colors.white.withOpacity(0),
                      backgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12)), //for the round edges

                      builder: (context) {
                        return Container(
                          height: 150,
                          decoration: myBoxDecoration(),
                          //!!!!! Переделать гартание. Сделать типо карусели !!!!!
                          //https://medium.com/flutter-community/how-to-create-card-carousel-in-flutter-979bc8ecf19
                          child: ListView(
                            children: <Widget>[
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('1'),
                                    Text('2'),
                                    Text('3'),
                                    Text('4'),
                                    Text('5'),
                                    Text('6'),
                                    Text('7'),
                                    Text('8'),
                                    Text('9'),
                                    Text('10'),
                                    Text('11'),
                                  ]),
                            ],
                          ),
                        );
                      },
                      context: context,
                    );
                  */