import 'package:flutter/material.dart';
import 'ligneBatterie.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TropikElec',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Liste des équipements'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  // final List<BluetoothDevice> devicesList = new List<BluetoothDevice>();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // _addDeviceTolist(final BluetoothDevice device) {
  //   if (!widget.devicesList.contains(device)) {
  //     setState(() {
  //       widget.devicesList.add(device);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading: Icon(
        //   Icons.menu,
        //   size: 34,
        // ),
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: InkWell(
              child: const Icon(Icons.refresh),
              onTap: () {
                //action code when clicked
                demandePermission();
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu',
                  style: TextStyle(fontSize: 25, color: Colors.white)),
            ),
            ListTile(
              leading: const Icon(
                Icons.menu,
              ),
              title: const Text('Liste des appareils'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.play_circle_filled,
              ),
              title: const Text('Demo'),
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.file_download,
              ),
              title: const Text('Téléchargements'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.question_mark,
              ),
              title: const Text('Paramètres'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            LigneBatterie(
              nom: "Smart Lithium",
              amperage: 150,
              identifiant: "1225341234324",
              signal: 3,
              isSwitched: true,
            ),
            LigneBatterie(
              nom: "Smart Lithium",
              amperage: 100,
              identifiant: "1235346323425",
              signal: 2,
              isSwitched: false,
            ),
            LigneBatterie(
              nom: "Smart Lithium",
              amperage: 100,
              identifiant: "13245354545342",
              signal: 1,
              isSwitched: true,
            )
          ],
        ),
      ),
    );
  }
}

void demandePermission() async {
  var permissionScan = await Permission.bluetoothConnect.request();
  var permissionConnect = await Permission.bluetoothScan.request();
  if (permissionScan.isGranted && permissionConnect.isGranted) {
    print("Permission ");
  }
}
