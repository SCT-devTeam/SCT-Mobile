import 'package:flutter/material.dart';
import 'package:sct_mobile/ui/widgets/personcard.dart';

// Recettes

class ReceiptBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Material(
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            SizedBox(height: 20.0),
//            PersonCard(
//                title: 'John Doe\n Facture n°',
//                icon: 'avatar_icon_black',
//                value: 0660032567,
//                color: 0xffdcd2fd),
          ],
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
