// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:table_tennis/model/Player.dart';
import '../screens/AboutGame.dart';
import '../screens/GameHistory.dart';
import '../screens/PageTwo.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);
  static const routeName = '/pageone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.now_widgets_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Новая игра',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                onPressed: () async {
                  Navigator.of(context).pushNamed(PageTwo.routeName);
                  //Сохраняются значения игроков(в полях "имя"/"отдел") с предыдущей игры
                  while (Player.players.isNotEmpty) {
                    Player.players.removeLast();
                  }
                }),
            TextButton(
              child: Row(
                children: [
                  Icon(
                    Icons.history_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'История игр',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(GameHistory.routeName);
              },
            ),
            TextButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Об игре',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AboutGame.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
