import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sct_mobile/core/data/models/invoice_repository.dart';
import 'package:sct_mobile/ui/widgets/invoicecard.dart';
import 'package:sct_mobile/ui/widgets/personcard.dart';
import 'package:sct_mobile/core/data/classes/invoice.dart';
import 'package:sct_mobile/core/data/models/api.dart';
import 'package:sct_mobile/core/data/classes/customer.dart';

class WritingsPage extends StatefulWidget {
  @override
  _WritingsPageState createState() => _WritingsPageState();
}

class _WritingsPageState extends State<WritingsPage> {
  List<Invoice> _invoices = <Invoice>[];
  Iterable allInvoices;
  int company_id;
  int customer_id;

  @override
  void initState() {
    super.initState();
    updateInvoices();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        child: Material(
          child: ListView.builder(
            itemCount: _invoices.length,
            itemBuilder: (context, index) =>
                InvoiceCard(invoice: _invoices[index]),
            padding: EdgeInsets.all(30.0),
//          children: <Widget>[
//            SizedBox(height: 20.0),
//            PersonCard(
//                title: 'John Doe',
//                icon: 'avatar_icon_black',
//                value: 0660032567,
//                color: 0xffdcd2fd),
//            SizedBox(height: 20.0),
//            PersonCard(
//                title: 'John Doe',
//                icon: 'avatar_icon_black',
//                value: 0660032567,
//                color: 0xffdcd2fd),
//            SizedBox(height: 20.0),
//            PersonCard(
//                title: 'John Doe',
//                icon: 'avatar_icon_black',
//                value: 0660032567,
//                color: 0xffdcd2fd),
//          ],
          ),
        ),
        onWillPop: () async => false,
      );

  void updateInvoices() async {
    CallApi().getData('api/allInvoice').then((response) {
      setState(() {
        var res = json.decode(response.body);
        Iterable list = res;
        _invoices = list.map((model) => Invoice.fromJSON(model)).toList();
      });
    });
  }
}
