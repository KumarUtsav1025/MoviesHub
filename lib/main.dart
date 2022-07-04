import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/Screens/Home.dart';
import 'package:movies/Widgets.dart';
import 'package:movies/main.dart';

import 'Screens/MovieDetail.dart';
import 'Screens/MoviePage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage() ,
      );
  }
}



