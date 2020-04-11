import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sct_mobile/core/data/models/invoice_repository.dart';
import 'package:sct_mobile/ui/widgets/invoicecard.dart';
import 'package:sct_mobile/ui/widgets/personcard.dart';
import 'package:sct_mobile/core/data/classes/invoice.dart';
import 'package:sct_mobile/core/data/models/api.dart';

class WritingsPage extends StatefulWidget {
  @override
  _WritingsPageState createState() => _WritingsPageState();
}

class _WritingsPageState extends State<WritingsPage> {
  List<Invoice> _invoices = <Invoice>[];
  int company_id;
  int customer_id;

  @override
  void initState() {
    super.initState();
//    getInvoices(CallApi().getCompanyId(),
//        CallApi().getCustomerId(CallApi().getCompanyId()));
    getInvoices(6, 1);
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

  updateInvoices() {
    company_id = CallApi().getCompanyId();
//    CallApi().getCustomers(company_id);
//    customer_id = CallApi().getCustomerId(company_id);

    CallApi().getInvoices(company_id, customer_id).then((response) {
      setState(() {
        var res = json.decode(response.body);
        Iterable list = res['invoices'];
        _invoices = list.map((model) => Invoice.fromJSON(model)).toList();
        print(_invoices);
      });
    });
  }

  getInvoices(int company_id, int customer_id) {
    final data = {'company_id': company_id, 'customer_id': customer_id};
    CallApi().postData(data, 'api/invoice').then((response) {
      setState(() {
        var res = json.decode(response.body);
        Iterable list = res['invoices'];
        _invoices = list.map((model) => Invoice.fromJSON(model)).toList();
      });
    });
//    final Stream<Invoice> stream = await fetchInvoices(6, 1);
//    print(stream);
//    stream.listen((Invoice invoice) => setState(() => _invoices.add(invoice)));
  }
}
