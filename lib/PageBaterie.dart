import 'package:flutter/material.dart';
import 'package:flutter_application/AlertScreen.dart';
import 'package:flutter_application/DetailBateriePage.dart';
import 'PageDonnees.dart';
import 'components/ChangePageBat.dart';
import 'components/MonDrawer.dart';

class NavPageBaterie extends StatefulWidget {
  const NavPageBaterie({super.key});

  @override
  State<NavPageBaterie> createState() => _NavPageBaterieState();
}

class _NavPageBaterieState extends State<NavPageBaterie> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Detail Baterie",
            textAlign: TextAlign.center,
          ),
        ),
        drawer: MonDrawer(context),
        body: Stack(
          children: <Widget>[
            ChangePageBat(const AlertScreen(), 0, index),
            ChangePageBat(const DetailBateriePage(), 1, index),
            ChangePageBat(NavDonnees(), 2, index),
          ],
        ), //drawer: Widget();
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 180, 180, 180),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.lock),
                  label: 'Protections',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Configuration',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart),
                  label: 'Données',
                ),
              ],
              currentIndex: index,
              selectedItemColor: Colors.white,
              backgroundColor: Colors.transparent,
              onTap: (value) {
                setState(() {
                  index = value;
                });
              }),
        ),
      ),
    );
  }
}
