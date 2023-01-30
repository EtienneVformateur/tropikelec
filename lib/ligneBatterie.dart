import 'package:flutter/material.dart';

class LigneBatterie extends StatelessWidget {
  const LigneBatterie({
    Key? key,
    required this.nom,
    required this.amperage,
    required this.identifiant,
    required this.signal,
    required this.isSwitched,
  }) : super(key: key);

  final String nom;
  final int amperage;
  final String identifiant;
  final int signal;
  final bool isSwitched;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(88, 146, 144, 144),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      height: 80,
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
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
                  Text("$nom ($amperage Ah)",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20)),
                  Text(
                    identifiant,
                    textAlign: TextAlign.left,
                  )
                ],
              ),
              if (signal == 1)
                const Icon(
                  Icons.signal_cellular_alt_1_bar_sharp,
                  color: Colors.blue,
                )
              else if (signal == 2)
                const Icon(
                  Icons.signal_cellular_alt_2_bar,
                  color: Colors.blue,
                )
              else if (signal == 3)
                const Icon(
                  Icons.signal_cellular_alt_sharp,
                  color: Colors.blue,
                ),
              Switch(
                  activeColor: Colors.green,
                  value: isSwitched,
                  onChanged: (change) {
                    print("Clic");
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
