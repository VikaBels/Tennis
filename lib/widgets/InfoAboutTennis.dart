// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:table_tennis/model/Post.dart';

Widget InfoAboutTennis(BuildContext context, var post) {
  return FutureBuilder<Post>(
    future: post,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ListView(
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              snapshot.data!.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17),
              child: Text(
                snapshot.data!.extract,
                style: TextStyle(
                  fontSize: 17,
                  letterSpacing: 0.6,
                  wordSpacing: 2,
                ),
              ),
            ),
          ],
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
