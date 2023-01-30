import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

// import 'app_localizations.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// translation : avec fichier .arb
// https://medium.com/@pinkesh.earth/easy-way-to-internationalize-and-localize-your-flutter-app-flutterbeads-e250fbcf63e2
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

  // Widget switch(ScanResult r){

  //   return Switch(
  //                 activeColor: Colors.green,
  //                 value: isSwitched,
  //                 onChanged: (change) {
  //                   print("Clic");
  //                 });  }

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
class ParametresPage extends StatefulWidget {
  const ParametresPage({super.key});

  @override
  State<ParametresPage> createState() => _ParametresPageState();
}

class _ParametresPageState extends State<ParametresPage> {
  final List<String> items = [
    'Français',
    'Anglais',
  ];
  final List<String> temp = [
    'Celcius (°C)',
    'Fahrenheit (°F)',
  ];
  String? selectedValue;
  String? selectedTemp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text(
          // AppLocalizations.of(context)?.translate('first_string'),
          "Paramètres",
          textAlign: TextAlign.left,
          selectionColor: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      drawer: drawer(context),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: const Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      WidgetSpan(
                          child: Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 18,
                      )),
                      TextSpan(text: 'Retour'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset('assets/images/logo.png'),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: new Alignment(-1, -1),
                      end: new Alignment(-0.5, 1),
                      colors: [
                        Color.fromARGB(255, 255, 249, 191),
                        Color.fromARGB(255, 255, 251, 214),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8)
                      ],
                      // center: Alignment.topLeft,
                      // radius: 0.8,
                    ),
                  ),
                  child: ListTile(
                    tileColor: const Color.fromARGB(33, 33, 149, 243),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    title: Text(
                      "Panel Solaire Connect v1.0",
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text("Copyright ©"),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Langue",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          'Sélectionner',
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                          return langue(selectedValue);
                        },
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Unité de température",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Text(
                          'Sélectionner',
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: temp
                            .map((temp) => DropdownMenuItem<String>(
                                  value: temp,
                                  child: Text(
                                    temp,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedTemp,
                        onChanged: (value) {
                          setState(() {
                            selectedTemp = value as String;
                          });
                          return langue(selectedTemp);
                        },
                        buttonHeight: 40,
                        buttonWidth: 160,
                        itemHeight: 40,
                        dropdownWidth: 160,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void langue(select) {
    print(select);
  }

  void temperature(select) {
    print(select);
  }
}

// La page Sauvegarde de fichiers

class SauvegardePage extends StatefulWidget {
  const SauvegardePage({super.key});

  @override
  State<SauvegardePage> createState() => _SauvegardePageState();
}

class _SauvegardePageState extends State<SauvegardePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text(
          "Sauvegarde de fichiers",
          textAlign: TextAlign.left,
        ),
      ),
      drawer: Drawer(child: drawer(context)),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
            ),
            // retour
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: const Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      WidgetSpan(
                          child: Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 18,
                      )),
                      TextSpan(text: 'Retour'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: new Alignment(-1, -1),
                      end: new Alignment(-0.5, 1),
                      colors: [
                        Color.fromARGB(255, 255, 249, 191),
                        Color.fromARGB(255, 255, 251, 214),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8)
                      ],
                      // center: Alignment.topLeft,
                      // radius: 0.8,
                    ),
                  ),
                  child: ListTile(
                    tileColor: const Color.fromARGB(33, 33, 149, 243),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    title: Text(
                      "Smart Lithium (100Ah)",
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("1856233252663"),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              WidgetSpan(
                                  child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 0, 0, 0),
                                size: 18,
                              )),
                              TextSpan(
                                  text: '15-09-2022 09:46',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    leading: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // Icon(Icons.wifi_2_bar), // icon-1
                        Icon(
                          Icons.battery_charging_full,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // icon-1
                        Icon(
                          Icons.file_download,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: new Alignment(-1, -1),
                      end: new Alignment(-0.5, 1),
                      colors: [
                        Color.fromARGB(255, 255, 249, 191),
                        Color.fromARGB(255, 255, 251, 214),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8)
                      ],
                      // center: Alignment.topLeft,
                      // radius: 0.8,
                    ),
                  ),
                  child: ListTile(
                    leading: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // Icon(Icons.wifi_2_bar), // icon-1
                        Icon(
                          Icons.battery_charging_full,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // icon-1
                        Icon(
                          Icons.file_download,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                    tileColor: const Color.fromARGB(33, 33, 149, 243),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    title: Text(
                      "Smart Lithium (100Ah)",
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("1856233285256"),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              WidgetSpan(
                                  child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 0, 0, 0),
                                size: 18,
                              )),
                              TextSpan(
                                  text: '17-06-2022 04:52',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

// la page téléchargement
class TelechargementPage extends StatefulWidget {
  const TelechargementPage({super.key});

  @override
  State<TelechargementPage> createState() => _TelechargementPageState();
}

class _TelechargementPageState extends State<TelechargementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text(
          "Téléchargements",
          textAlign: TextAlign.left,
        ),
      ),
      drawer: Drawer(child: drawer(context)),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
            ),
            // retour
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: const Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      WidgetSpan(
                          child: Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 18,
                      )),
                      TextSpan(text: 'Retour'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: new Alignment(-1, -1),
                      end: new Alignment(-0.5, 1),
                      colors: [
                        Color.fromARGB(255, 255, 249, 191),
                        Color.fromARGB(255, 255, 251, 214),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8)
                      ],
                      // center: Alignment.topLeft,
                      // radius: 0.8,
                    ),
                  ),
                  child: ListTile(
                    tileColor: const Color.fromARGB(33, 33, 149, 243),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Batterie Lithiium LiFeP04 Smart",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                  text: '12,8V / 50-100-200 Ah',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fiche Technique",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    leading: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // Icon(Icons.wifi_2_bar), // icon-1
                        Icon(
                          Icons.battery_charging_full,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // icon-1
                        Icon(
                          Icons.file_download,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: new Alignment(-1, -1),
                      end: new Alignment(-0.5, 1),
                      colors: [
                        Color.fromARGB(255, 255, 249, 191),
                        Color.fromARGB(255, 255, 251, 214),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8)
                      ],
                      // center: Alignment.topLeft,
                      // radius: 0.8,
                    ),
                  ),
                  child: ListTile(
                    tileColor: const Color.fromARGB(33, 33, 149, 243),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Batterie Lithiium LiFeP04 Smart",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                  text: '12,8V /100 Ah (Varta)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fiche Technique",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    leading: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // Icon(Icons.wifi_2_bar), // icon-1
                        Icon(
                          Icons.battery_charging_full,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // icon-1
                        Icon(
                          Icons.file_download,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: new Alignment(-1, -1),
                      end: new Alignment(-0.5, 1),
                      colors: [
                        Color.fromARGB(255, 255, 249, 191),
                        Color.fromARGB(255, 255, 251, 214),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8)
                      ],
                      // center: Alignment.topLeft,
                      // radius: 0.8,
                    ),
                  ),
                  child: ListTile(
                    tileColor: const Color.fromARGB(33, 33, 149, 243),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Batterie Lithiium LiFeP04 Smart",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                  text: '12,8V / 150 Ah (Varta)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fiche Technique",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    leading: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // Icon(Icons.wifi_2_bar), // icon-1
                        Icon(
                          Icons.battery_charging_full,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // icon-1
                        Icon(
                          Icons.file_download,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                  )),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: new Alignment(-1, -1),
                      end: new Alignment(-0.5, 1),
                      colors: [
                        Color.fromARGB(255, 255, 249, 191),
                        Color.fromARGB(255, 255, 251, 214),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8)
                      ],
                      // center: Alignment.topLeft,
                      // radius: 0.8,
                    ),
                  ),
                  child: ListTile(
                    tileColor: const Color.fromARGB(33, 33, 149, 243),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Batterie Lithiium LiFeP04 Smart",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                  text: '12,8V / 130 Ah (Sous siège)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fiche Technique",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    leading: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // Icon(Icons.wifi_2_bar), // icon-1
                        Icon(
                          Icons.battery_charging_full,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // icon-1
                        Icon(
                          Icons.file_download,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: new Alignment(-1, -1),
                      end: new Alignment(-0.5, 1),
                      colors: [
                        Color.fromARGB(255, 255, 249, 191),
                        Color.fromARGB(255, 255, 251, 214),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8),
                        Color(0xffe8e8e8)
                      ],
                      // center: Alignment.topLeft,
                      // radius: 0.8,
                    ),
                  ),
                  child: ListTile(
                    tileColor: const Color.fromARGB(33, 33, 149, 243),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Batterie Lithiium LiFeP04 Smart",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                  text: '12,8V / 180 Ah (Sous siège)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fiche Technique",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    leading: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // Icon(Icons.wifi_2_bar), // icon-1
                        Icon(
                          Icons.battery_charging_full,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: <Widget>[
                        // icon-1
                        Icon(
                          Icons.file_download,
                          size: 36.0,
                        ), // icon-2
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
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
