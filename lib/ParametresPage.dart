import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'components/MonDrawer.dart';
import 'TelechargementPage.dart';
import 'SauvegardePage.dart';
import 'main.dart';

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
      drawer: MonDrawer(context),
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
