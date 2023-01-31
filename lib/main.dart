import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'HomePage.dart';

void main() {
  Paint.enableDithering = true;
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const HomePageWidget());
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Home2Widget(),
      ),
    );
  }
}

class Home2Widget extends StatefulWidget {
  const Home2Widget({super.key});

  @override
  State<Home2Widget> createState() => _Home2WidgetState();
}

class _Home2WidgetState extends State<Home2Widget> {
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0.65, 1.15),
          colors: [
            Color.fromARGB(255, 124, 124, 124),
            Color.fromARGB(255, 240, 184, 0),
          ],
          stops: [0.75, 1],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/logo.png",
            width: 300,
          ),
        ],
      ),
    );
  }
}
