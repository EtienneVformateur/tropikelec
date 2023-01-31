import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BtnChauffage extends StatelessWidget {
  const BtnChauffage({
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
              Text("Mode chauffage (en option)"),
              Switch(value: false, onChanged: null)
            ],
          ),
        )
      ],
    );
  }
}
