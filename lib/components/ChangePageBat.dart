import 'package:flutter/material.dart';

class ChangePageBat extends StatelessWidget {
  final int initialIndex;
  final int indexPage;
  final Widget page;
  ChangePageBat(this.page, this.initialIndex, this.indexPage);

  @override
  Widget build(BuildContext context) {
    return new Offstage(
      offstage: initialIndex != indexPage,
      child: new TickerMode(
        enabled: initialIndex == indexPage,
        child: new MaterialApp(
          debugShowCheckedModeBanner: false,
          home: page,
        ),
      ),
    );
  }
}
