import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'HomePage.dart';
import 'components/MonDrawer.dart';

import 'package:flutter_application/DetailBateriePage.dart';
import 'package:flutter_application/ligneBatterie.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'ParametresPage.dart';
import 'SauvegardePage.dart';
import 'TelechargementPage.dart';
import 'InfoBatterie.dart';


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

class MyApp extends StatelessWidget {
  final title = 'Liste des équipements';

  MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: white), // thème de l'application en blanc
      home: MyHomePage(title: title),
      routes: {
        "/infoBatteries": (context) => InfoBatterieScreen(),
        '/detailBaterie': (context) => const DetailBateriePage(),
      },

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


      drawer: drawer(context),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [

          const LigneBatterie(
              nom: '12V',
              amperage: 150,
              identifiant: 'LT-0945',
              signal: 80,
              isSwitched: true),
          GestureDetector(
            onTap: () => {Navigator.pushNamed(context, '/infoBatteries')},

          GestureDetector(
            onTap: () => {
              Navigator.pushNamed(context, '/detailBaterie'),
            },

            child: const LigneBatterie(
                nom: '12V',
                amperage: 150,
                identifiant: 'LT-0945',
                signal: 80,

                isSwitched: false),
          )

                isSwitched: true),
          ),
          const LigneBatterie(
              nom: '12V',
              amperage: 150,
              identifiant: 'LT-0945',
              signal: 80,
              isSwitched: false)

        ]),
      )),

    );
  }
}
