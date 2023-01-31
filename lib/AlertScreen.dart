import 'package:flutter/material.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // mainAxisSize: MainAxisSize.max,Padding(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.8, -0.85),
                      child: Container(
                        width: 110,
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Icon(
                              Icons.shield,
                              color: Color.fromARGB(255, 124, 123, 123),
                              size: 60,
                            ),
                            Text(
                              'Court-circuit',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.8, -0.85),
                      child: Container(
                        width: 110,
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Icon(
                              Icons.shield,
                              color: Color.fromARGB(255, 124, 123, 123),
                              size: 60,
                            ),
                            Text(
                              'Surcharge',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.8, -0.85),
                      child: Container(
                        width: 110,
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Icon(
                              Icons.shield,
                              color: Color.fromARGB(255, 124, 123, 123),
                              size: 60,
                            ),
                            Text(
                              'Décharge importante',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.8, -0.85),
                      child: Container(
                        width: 110,
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Icon(
                              Icons.shield,
                              color: Color.fromARGB(255, 124, 123, 123),
                              size: 60,
                            ),
                            Text(
                              'Décharge à haute température',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.8, -0.85),
                      child: Container(
                        width: 110,
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Icon(
                              Icons.shield,
                              color: Color.fromARGB(255, 124, 123, 123),
                              size: 60,
                            ),
                            Text(
                              'Décharge à basse température',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.8, -0.85),
                      child: Container(
                        width: 110,
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(
                              Icons.shield,
                              color: Color.fromARGB(255, 124, 123, 123),
                              size: 60,
                            ),
                            InkWell(
                              onTap: () async {},
                              child: const Text(
                                'Charge à haute température',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.8, -0.85),
                      child: Container(
                        width: 110,
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Icon(
                              Icons.shield,
                              color: Color.fromARGB(255, 124, 123, 123),
                              size: 60,
                            ),
                            Text(
                              'Charge à basse température',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.8, -0.85),
                      child: Container(
                        width: 110,
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Icon(
                              Icons.shield,
                              color: Color(0xFF4DCC4D),
                              size: 60,
                            ),
                            Text(
                              'Surtension des cellules',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.8, -0.85),
                      child: Container(
                        width: 110,
                        height: 120,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Icon(
                              Icons.settings,
                              color: Color(0xFF4DCC4D),
                              size: 60,
                            ),
                            Text(
                              'Equilibrage des cellules automatique',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(-0.8, -0.85),
                        child: Container(
                          width: 110,
                          height: 50,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Icon(
                                Icons.shield,
                                color: Color.fromARGB(255, 124, 123, 123),
                                size: 35,
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Text(
                                  'Gris : Inactif',
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(-0.8, -0.85),
                        child: Container(
                          width: 110,
                          height: 50,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Icon(
                                Icons.settings,
                                color: Color.fromARGB(255, 124, 123, 123),
                                size: 35,
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Text(
                                  'Gris : Inactif',
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(-0.8, -0.85),
                        child: Container(
                          width: 110,
                          height: 50,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Icon(
                                Icons.shield,
                                color: Color(0xFF4DCC4D),
                                size: 35,
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Text(
                                  'Vert : En cours',
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(-0.8, -0.85),
                        child: Container(
                          width: 110,
                          height: 50,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Icon(
                                Icons.settings,
                                color: Color(0xFF4DCC4D),
                                size: 35,
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Text(
                                  'Vert : En cours',
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(-0.95, -0.85),
                        child: Container(
                          width: 110,
                          height: 50,
                          child: Align(
                            alignment: const AlignmentDirectional(0, -0.1),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Icon(
                                  Icons.shield,
                                  color: Color(0xFFF0B435),
                                  size: 35,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Text(
                                    'Orange : Erreur',
                                    style: TextStyle(fontSize: 10),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MaterialButton(
                height: 40,
                minWidth: 200,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Text(
                  'Historique',
                  style: const TextStyle(fontSize: 14),
                ),
                mouseCursor: SystemMouseCursors.help,
                color: const Color.fromARGB(255, 178, 189, 197),
                textColor: Colors.black,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
