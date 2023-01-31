import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DechargeBtn extends StatelessWidget {
  const DechargeBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Stopper la charge / décharge"),
              Switch(value: false, onChanged: null)
            ],
          ),
        )
      ],
    );
  }
}
