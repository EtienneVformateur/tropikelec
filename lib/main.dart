import 'package:flutter/material.dart';
import 'package:flutter_application/DetailBateriePage.dart';
import 'package:flutter_application/ligneBatterie.dart';

import 'ParametresPage.dart';
import 'SauvegardePage.dart';
import 'TelechargementPage.dart';

void main() {
  runApp(MyApp());
}

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
        '/detailBaterie': (context) => const DetailBateriePage(),
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
      drawer: drawer(context),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
          GestureDetector(
            onTap: () => {
              Navigator.pushNamed(context, '/detailBaterie'),
            },
            child: const LigneBatterie(
                nom: '12V',
                amperage: 150,
                identifiant: 'LT-0945',
                signal: 80,
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

// mon drawer

Widget drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.menu,
            ),
            title: Text('Menu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.menu,
          ),
          title: const Text('Liste des appareils'),
          onTap: () {
            // Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.play_circle_filled,
          ),
          title: const Text('Démo'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.save_alt,
          ),
          title: const Text('Sauvegarde de fichiers'),
          onTap: () {
            // Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SauvegardePage()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.file_download,
          ),
          title: const Text('Téléchargements'),
          onTap: () {
            // Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelechargementPage()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.question_mark,
          ),
          title: const Text('Paramètres'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ParametresPage()));
          },
        ),
      ],
    ),
  );
}
