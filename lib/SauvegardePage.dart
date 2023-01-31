// TODO Implement this library.

import 'package:flutter/material.dart';
import 'components/MonDrawer.dart';
import 'TelechargementPage.dart';

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
      drawer: Drawer(child: MonDrawer(context)),
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
