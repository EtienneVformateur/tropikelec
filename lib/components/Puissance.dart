import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Puissance extends StatelessWidget {
  const Puissance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 0, 10),
                  child: Text('Puissance'),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
                  child: Text('655 w', textAlign: TextAlign.end),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
