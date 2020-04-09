import 'package:flutter/material.dart';
import 'package:sct_mobile/ui/widgets/invoicecard.dart';

// Écritures

class Invoices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Material(
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            SizedBox(height: 20.0),
            InvoiceCard(
                title: 'Fournitures',
                icon: 'invoice_icon_black',
                price: 350,
                date: "06/03/1998",
                color: 0xfffbe48e),
          ],
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
