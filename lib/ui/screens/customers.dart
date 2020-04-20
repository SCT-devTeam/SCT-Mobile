import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sct_mobile/core/data/models/customer_repository.dart';
import 'package:sct_mobile/ui/widgets/personcard.dart';
import 'package:sct_mobile/core/data/classes/customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:sct_mobile/core/data/models/api.dart';

class CustomersPage extends StatefulWidget {
  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<CustomersPage> {
  List<Customer> _customers = <Customer>[];
  int company_id;

  Future<int> getCompanyId() async {
    var cmp_id = await CallApi().getCompanyId();

    return cmp_id;
  }

  refreshCustomers() {
    getCompanyId().then((response) {
      setState(() {
        company_id = response;
      });
      getCustomers(company_id);
    });
  }

  @override
  void initState() {
    super.initState();

    refreshCustomers();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        child: Material(
          child: ListView.builder(
            itemCount: _customers.length,
            itemBuilder: (context, index) => InkWell(
                child: PersonCard(customer: _customers[index]),
                onLongPress: () => showDeleteDialog(_customers[index].id)),
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
    final data = {'id_company': company_id};
    CallApi().postData(data, 'api/customers').then((response) {
      setState(() {
        var res = json.decode(response.body);
        Iterable list = res;
        _customers = list.map((model) => Customer.fromJSON(model)).toList();
      });
    });
  }

  deleteCustomer(int customer_id) {
    var data = {'id': customer_id};
    CallApi().postData(data, 'api/deleteCustomer').then((response) {
      setState(() {
        if (response.statusCode == 200) {
          print("User deleted");
        } else {
          print("Error from API code: ${response.statusCode}");
        }
      });
    });
  }

  showDeleteDialog(id) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: const Text(
            'Voulez-vous vraiment vraiment supprimer ce client?',
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Non'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            FlatButton(
              child: const Text('Oui'),
              onPressed: () {
                deleteCustomer(id);
                Navigator.of(context).pop(true);
                refreshCustomers();
              },
            ),
          ],
        );
      },
    );
  }
}
