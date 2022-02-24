// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:table_tennis/model/Person.dart';
import 'package:table_tennis/widgets/Field.dart';

class AboutPerson extends StatelessWidget {
  final int number;
  AsyncSnapshot<List<Person>> snapshot;
  AboutPerson(this.number, this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 28, 12, 4),
          child: Text('$number'),
        ),
        Flexible(
          flex: 2,
          child: Field(snapshot, 'Отдел', false),
        ),
        SizedBox(width: 16),
        Flexible(
          flex: 2,
          child: Field(snapshot, 'Имя', true),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}

 /* 
 BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(width: 20, color: Colors.grey.shade300),
  );
}
 showModalBottomSheet(
                      barrierColor: Colors.white.withOpacity(0),
                      backgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12)), //for the round edges

                      builder: (context) {
                        return Container(
                          height: 150,
                          decoration: myBoxDecoration(),
                          //https://medium.com/flutter-community/how-to-create-card-carousel-in-flutter-979bc8ecf19
                          child: ListView(
                            children: <Widget>[
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('1'),
                                    Text('2'),
                                    Text('3'),
                                  ]),
                            ],
                          ),
                        );
                      },
                      context: context,
                    );
                  */