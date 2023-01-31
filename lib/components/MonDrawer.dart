import 'package:flutter/material.dart';

import '../HomePage.dart';
import '../ParametresPage.dart';
import '../SauvegardePage.dart';
import '../TelechargementPage.dart';

Widget MonDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.menu,
            ),
            title: Text('Menu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.menu,
          ),
          title: const Text('Liste des appareils'),
          onTap: () {
            // Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.play_circle_filled,
          ),
          title: const Text('Démo'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.save_alt,
          ),
          title: const Text('Sauvegarde de fichiers'),
          onTap: () {
            // Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SauvegardePage()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.file_download,
          ),
          title: const Text('Téléchargements'),
          onTap: () {
            // Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TelechargementPage()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.question_mark,
          ),
          title: const Text('Paramètres'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ParametresPage()));
          },
        ),
      ],
    ),
  );
}
