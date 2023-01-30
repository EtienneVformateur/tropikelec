import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

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
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: white), // thème de l'application en blanc
      home: MyHomePage(title: title),
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
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> scanResultList = [];
  bool _isScanning = false;

  @override
  initState() {
    super.initState();
    initBle();
  }

  void initBle() {
    flutterBlue.isScanning.listen((isScanning) {
      _isScanning = isScanning;
      setState(() {});
    });
  }

  scan() async {
    if (!_isScanning) {
      scanResultList.clear();
      await flutterBlue.startScan(timeout: const Duration(seconds: 4));
      var listen = flutterBlue.scanResults.listen((results) {
        for (ScanResult r in results) {
          if (r.device.name.isNotEmpty) {
            if (r.device.name.startsWith("LT")) {
              if (!scanResultList.contains(r)) {
                scanResultList.add(r);
              }

              //
              // scanResultList = results;
            }
          }
        }
        setState(() {});

        print(scanResultList);
      });
    } else {
      flutterBlue.stopScan();
    }
  }

  Widget deviceSignal(ScanResult r) {
    // • Un lien plus fort est entre -30 à -55
    // • Une connexion solide commence par -55 à -67
    // • Une connexion terrible commence à partir de -80 à -90
    // • Une connexion inutilisable démarre à partir de -90 et plus bas
    int signal = r.rssi;
    if (signal < -90) {
      return const Icon(
        Icons.signal_cellular_alt_1_bar_sharp,
        color: Colors.blue,
      );
    } else if (signal >= -80 && signal <= -90) {
      return const Icon(
        Icons.signal_cellular_alt_2_bar,
        color: Colors.blue,
      );
    } else if (signal >= -80 && signal <= -67) {
      return const Icon(
        Icons.signal_cellular_alt_2_bar,
        color: Colors.blue,
      );
    } else if (signal >= -67 && signal <= -55) {
      return const Icon(
        Icons.signal_cellular_alt_sharp,
        color: Colors.blue,
      );
    } else {
      return const Icon(
        Icons.signal_cellular_alt_sharp,
        color: Colors.blue,
      );
    }

    // return Text(r.rssi.toString());
  }

  Widget deviceMacAddress(ScanResult r) {
    return Text(r.device.id.id);
  }

  Widget deviceName(ScanResult r) {
    String name = '';

    // if (r.device.name.isNotEmpty) {
    //   name = r.device.name;
    // } else if (r.advertisementData.localName.isNotEmpty) {
    //   name = r.advertisementData.localName;
    // } else {
    //   name = "Smart Lithium";
    // }

    if (r.device.name.isNotEmpty) {
      if (r.device.name.startsWith("LT")) {
        name = r.device.name;
      }
    }

    return Text(name);
  }

  Widget leading(ScanResult r) {
    return const CircleAvatar(
      child: Icon(
        Icons.battery_charging_full,
        color: Colors.white,
      ),
      backgroundColor: Colors.blue,
    );
  }

  void onTap(ScanResult r) {
    print('${r.device.name}');
  }

  Widget listItem(ScanResult r) {
    return ListTile(
      tileColor: const Color.fromARGB(33, 33, 149, 243),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onTap: () => onTap(r),
      leading: leading(r),
      title: deviceName(r),
      subtitle: deviceMacAddress(r),
      trailing: deviceSignal(r),
    );
  }

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
              onPressed: scan,
              icon: Icon(_isScanning ? Icons.stop : Icons.refresh),
            ),
          ),
        ],
      ),
      drawer: drawer(context),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: scanResultList.length,
          itemBuilder: (context, index) {
            return listItem(scanResultList[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Color.fromARGB(0, 158, 158, 158),
            );
          },
        ),
      )),
    );
  }
}

// La page Paramètres

// La page Sauvegarde de fichiers

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
