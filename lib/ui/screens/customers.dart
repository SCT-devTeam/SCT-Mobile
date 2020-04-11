import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sct_mobile/core/data/models/customer_repository.dart';
import 'package:sct_mobile/ui/widgets/personcard.dart';
import 'package:sct_mobile/core/data/classes/customer.dart';
import 'package:sct_mobile/core/data/models/api.dart';

class CustomersPage extends StatefulWidget {
  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<CustomersPage> {
  List<Customer> _customers = <Customer>[];

  @override
  void initState() {
    super.initState();
    getCustomers(6);
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        child: Material(
          child: ListView.builder(
            itemCount: _customers.length,
            itemBuilder: (context, index) =>
                PersonCard(customer: _customers[index]),
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

  getCustomers(int company_id) {
    final data = {'company_id': company_id};
    CallApi().postData(data, 'api/customers').then((response) {
      setState(() {
        var res = json.decode(response.body);
        Iterable list = res['cust'];
        _customers = list.map((model) => Customer.fromJSON(model)).toList();
//        print(_customers);
      });
    });
//    final Stream<Invoice> stream = await fetchInvoices(6, 1);
//    print(stream);
//    stream.listen((Invoice invoice) => setState(() => _invoices.add(invoice)));
  }
}
