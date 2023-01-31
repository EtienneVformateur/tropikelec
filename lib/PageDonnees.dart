import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'components/CaseIndice.dart';
import 'components/ChartData.dart';
import 'components/GraphBat.dart';

class NavDonnees extends StatefulWidget {
  @override
  State<NavDonnees> createState() => _NavDonneesState();
}

class _NavDonneesState extends State<NavDonnees> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageDonneesBat(),
        //drawer: Widget();
      ),
    );
  }
}

class PageDonneesBat extends StatefulWidget {
  @override
  State<PageDonneesBat> createState() => _PageDonneesBatState();
}

class _PageDonneesBatState extends State<PageDonneesBat> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            CaseIndice('Tension', '13.1v', Color.fromARGB(255, 177, 40, 40)),
            GraphBat(Color.fromARGB(255, 177, 40, 40), [
              ChartData('00h00', 13.1),
              ChartData('02h00', 13.1),
              ChartData('04h00', 13.1),
              ChartData('06h00', 13.1),
              ChartData('08h00', 13.1),
              ChartData('10h00', 13.1),
            ]),
          ],
        ),
        Column(
          children: [
            CaseIndice('Courant', '50.0A', Color.fromARGB(255, 51, 114, 231)),
            GraphBat(Color.fromARGB(255, 51, 114, 231), [
              ChartData('00h00', -80),
              ChartData('02h00', -75),
              ChartData('04h00', -35),
              ChartData('06h00', 20),
              ChartData('08h00', 38),
              ChartData('10h00', 50),
            ]),
          ],
        ),
        Column(
          children: [
            CaseIndice('Puissance', '600.0W', Color.fromARGB(255, 95, 99, 105)),
            GraphBat(Color.fromARGB(255, 95, 99, 105), [
              ChartData('00h00', -1200),
              ChartData('02h00', -1200),
              ChartData('04h00', -600),
              ChartData('06h00', -150),
              ChartData('08h00', 500),
              ChartData('10h00', 600),
            ]),
          ],
        ),
        Column(
          children: [
            CaseIndice('Température', '26°C', Color.fromARGB(255, 95, 99, 105)),
            GraphBat(Color.fromARGB(255, 95, 99, 105), [
              ChartData('00h00', 5),
              ChartData('02h00', 10),
              ChartData('04h00', 18),
              ChartData('06h00', 26),
              ChartData('08h00', 28),
              ChartData('10h00', 26),
            ]),
          ],
        ),
      ],
    );
  }
}
