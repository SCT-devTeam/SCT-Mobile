import 'package:flutter/material.dart';

class Receipts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Center(child: Text("Page des recettes")),
        ],
      ),
    );
  }
}
