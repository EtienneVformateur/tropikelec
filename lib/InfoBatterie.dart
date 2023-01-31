import 'package:flutter/material.dart';
import 'package:flutter_application/components/MonDrawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'ParametresPage.dart';

class InfoBatterieScreen extends StatelessWidget {
  // This widget is the root of your application.
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
      title: 'Tropikelec',
      theme: ThemeData(primarySwatch: white),
      home: MyHomePage(title: 'Tropikelec'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InfoBatterie(
        tooltipBehavior: _tooltipBehavior, chartData: _chartData);
  }
}

List<GDPData> getChartData() {
  final List<GDPData> chartData = [
    GDPData('V', 80, const Color.fromARGB(255, 135, 38, 31)),
    GDPData('A', 25, const Color.fromARGB(255, 26, 114, 185)),
    GDPData('%', 75, const Color.fromARGB(255, 35, 156, 39)),
  ];
  return chartData;
}

class InfoBatterie extends StatelessWidget {
  const InfoBatterie({
    super.key,
    required TooltipBehavior tooltipBehavior,
    required List<GDPData> chartData,
  })  : _tooltipBehavior = tooltipBehavior,
        _chartData = chartData;

  final TooltipBehavior _tooltipBehavior;
  final List<GDPData> _chartData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "infos",
            textAlign: TextAlign.center,
          ),
        ),
        drawer: MonDrawer(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 230,
                  child: SfCircularChart(
                    annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                        widget: Container(
                          child: const Text.rich(TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: '70%',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40),
                            ),
                            TextSpan(
                                text: ' \n   Capacité restante ',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic, fontSize: 8)),
                          ])),
                        ),
                      )
                    ],
                    tooltipBehavior: _tooltipBehavior,
                    series: <CircularSeries>[
                      RadialBarSeries<GDPData, String>(
                          dataSource: _chartData,
                          xValueMapper: (GDPData data, _) => data.nom,
                          yValueMapper: (GDPData data, _) => data.gdp,
                          pointColorMapper: (GDPData data, _) => data.color,
                          // dataLabelSettings: DataLabelSettings(isVisible: true),
                          trackOpacity: 0.3,
                          enableTooltip: true,
                          maximumValue: 100)
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: Row(
                        children: const [
                          Text('-',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 135, 38, 31),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          Text("80.0V",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: const [
                          Text('-',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 26, 114, 185),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          Text("50.0A",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: const [
                          Text('-',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 35, 156, 39),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          Text("75.0%",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: const [
                          Text('-',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 135, 38, 31),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          Text("26°C",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      child: Text("Capacité restante",
                          style: TextStyle(color: Colors.grey)),
                    ),
                    Container(
                      child: Text("150.3/200.0 Ah",
                          style: TextStyle(color: Colors.green)),
                    ),
                    Container(
                      child: Text("Puissance restante",
                          style: TextStyle(color: Colors.grey)),
                    ),
                    Container(
                      child: Text("3607.2Wh/4800Wh",
                          style: TextStyle(color: Colors.green)),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      "VEILLE",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(88, 146, 144, 144),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  width: 350,
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.battery_charging_full,
                            size: 44,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Smart Lithium (100 Ah)",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20)),
                              Text(
                                "LT-0645",
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          Icon(Icons.login),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  "Tension",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text("13.1V", style: TextStyle(fontSize: 10))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Courant", style: TextStyle(fontSize: 10)),
                                Text("50.0A", style: TextStyle(fontSize: 10))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Puissance",
                                    style: TextStyle(fontSize: 10)),
                                Text("655w", style: TextStyle(fontSize: 10))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Temperature",
                                    style: TextStyle(fontSize: 10)),
                                Text("25°C", style: TextStyle(fontSize: 10))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Cicle", style: TextStyle(fontSize: 10)),
                                Text("66", style: TextStyle(fontSize: 10))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class GDPData {
  GDPData(this.nom, this.gdp, this.color);
  final String nom;
  final int gdp;
  final Color color;
}
