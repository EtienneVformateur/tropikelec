import 'package:flutter/material.dart';
import 'package:flutter_application/DetailBateriePage.dart';
import 'package:flutter_application/PageBaterie.dart';
import 'package:flutter_application/ligneBatterie.dart';

import 'InfoBatterie.dart';
import 'ParametresPage.dart';
import 'SauvegardePage.dart';
import 'TelechargementPage.dart';
import 'components/MonDrawer.dart';

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
        '/pageBaterie': (context) => const NavPageBaterie(),
        "/infoBatteries": (context) => InfoBatterieScreen(),
        // '/secondPage': (context) => MySecondPage(title: "Deuxième page"),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isScanning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(_isScanning ? Icons.stop : Icons.refresh),
            ),
          ),
        ],
      ),
      drawer: MonDrawer(context),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
          GestureDetector(
            onTap: () => {
              Navigator.pushNamed(context, '/pageBaterie'),
            },
            child: const LigneBatterie(
                nom: '12V',
                amperage: 150,
                identifiant: 'LT-0945',
                signal: 80,
                isSwitched: true),
          ),
          GestureDetector(
            onTap: () => {Navigator.pushNamed(context, '/infoBatteries')},
            child: const LigneBatterie(
                nom: '12V',
                amperage: 150,
                identifiant: 'LT-0945',
                signal: 80,
                isSwitched: false),
          )
        ]),
      )),
    );
  }
}
