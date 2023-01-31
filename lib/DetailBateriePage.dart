// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application/HomePage.dart';
import 'components/MonDrawer.dart';
import 'components/TemperaturCycle.dart';
import 'components/BtnChauffage.dart';
import 'components/ChargeProtection.dart';
import 'components/CircularGraph.dart';
import 'components/DechargeBtn.dart';
import 'components/Puissance.dart';
import 'components/TensionCourant.dart';

class DetailBateriePage extends StatefulWidget {
  const DetailBateriePage({
    super.key,
  });

  @override
  State<DetailBateriePage> createState() => _DetailBateriePageState();
}

class _DetailBateriePageState extends State<DetailBateriePage> {
  var title = "Detail de la batterie";
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
  bool _isScanning = false;
  @override
  Widget build(BuildContext context) {
    // FlutterBlue flutterBlue = FlutterBlue.instance;
    //TODO : DATA A CHANGER QUAND LE BLUETOOTH SERA OPERATIONNEL
    final List<ChartData> chartData = [
      ChartData('David', 1088, Colors.red),
      ChartData('Jack', 532, Colors.blue),
      ChartData('Others', 366, Colors.green)
    ];
    return Scaffold(
      body: ListView(
        children: [
          // Rond
          CircularGraph(chartData: chartData),
          // TEXT AVANT DIVIDER
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Capacité restante",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "70.4/100.0Ah > 847,113Wh/2400Wh",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // DIVIDER
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Divider(
                  color: Colors.grey,
                  height: 5,
                  thickness: 2,
                ),
              )
            ],
          ),
          // CARD
          // TENSION / COURANT
          TensionCourant(),
          // TEMPERATURE / CYCLE
          TemperatureCycle(),
          // BTN SWITCH DECHARGE
          DechargeBtn(),
          // PUISSANCE
          Puissance(),
          //CHARGE PROTECTION
          ChargeProtection(),
          //MODE CHAUFFAGE
          BtnChauffage(),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
