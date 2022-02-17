// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  static const routeName = '/GameHistory';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MyApp(post: fetchPost());
  }
}

Future<Post> fetchPost() async {
  final response = await http.get(Uri.parse(
      'https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exlimit=max&explaintext&exintro&titles=Table_tennis'));

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int pageid;
  final int ns;
  final String title;
  final String extract;

  Post(
      {required this.pageid,
      required this.ns,
      required this.title,
      required this.extract});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      pageid: json['query']['pages']['30589']['pageid'],
      ns: json['query']['pages']['30589']['ns'],
      title: json['query']['pages']['30589']['title'],
      extract: json['query']['pages']['30589']['extract'],
    );
  }
}

class MyApp extends StatelessWidget {
  final Future<Post> post;

  MyApp({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Tennis'),
      ),
      body: Center(
        child: ForInfo(context, post),
      ),
    );
  }
}

Widget ForInfo(BuildContext context, var post) {
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
