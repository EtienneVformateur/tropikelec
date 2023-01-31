import 'package:flutter/material.dart';

class CaseIndice extends StatelessWidget {
  final String titre;
  final String indice;
  final Color colors;
  CaseIndice(this.titre, this.indice, this.colors);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            colors,
            Colors.grey,
          ]),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(20),
          )),
      child: SizedBox(
        width: 250,
        height: 45,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  titre,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  indice,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
