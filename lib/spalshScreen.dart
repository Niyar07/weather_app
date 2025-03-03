import 'package:flutter/material.dart';
import 'package:wether_app/mainScreen.dart';

class Spalshscreen extends StatefulWidget {
  const Spalshscreen({super.key});

  @override
  State<Spalshscreen> createState() => _SpalshscreenState();
}

class _SpalshscreenState extends State<Spalshscreen> {
  loadNextPage() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Mainscreen()));
    });
  }

  void initshare() {
    super.initState();
    loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset("assets/images/logo1.jpg"),
            Text(
              "WeatherApp",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              "Developed By",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            Text(
              "Niyar Rane",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
