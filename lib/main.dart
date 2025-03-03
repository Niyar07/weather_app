import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wether_app/mainScreen.dart';
import 'package:wether_app/spalshScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Spalshscreen(),
      // This is comment
    );
  }
}
