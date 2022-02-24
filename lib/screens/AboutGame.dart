// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:table_tennis/model/Post.dart';
import 'package:table_tennis/widgets/InfoAboutTennis.dart';

class AboutGame extends StatefulWidget {
  static const routeName = '/AboutGame';

  @override
  State<AboutGame> createState() => _AboutGameState();
}

class _AboutGameState extends State<AboutGame> {
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
        child: InfoAboutTennis(context, post),
      ),
    );
  }
}
