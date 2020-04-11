import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sct_mobile/ui/widgets/primarybutton.dart';
import 'package:sct_mobile/ui/widgets/statcard.dart';
import 'package:sct_mobile/core/data/models/api.dart';
import 'package:http/http.dart';
import 'package:sct_mobile/core/data/models/api.dart';
import 'package:sct_mobile/ui/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';
import 'package:sct_mobile/core/data/classes/company.dart';
import 'package:sct_mobile/core/data/models/company_repository.dart';
import 'package:sct_mobile/core/data/classes/invoice.dart';
import 'package:sct_mobile/core/data/classes/customer.dart';
import 'package:sct_mobile/core/data/models/invoice_repository.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isLoading = false;
  bool _refreshButtonState = true;
  int invoicesTotal;
  int invoicesOverdue;
  int invoicesWaiting;
  int invoicesDisputed;
  int customersTotal = 0;
  int activeProspects;
  List<Invoice> _invoices = <Invoice>[];
  List<Customer> _customers = <Customer>[];

  void _logout() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    print(prefs.getString('token'));
    var res = await CallApi().getData('api/logout');
    print(res.body);
    if (res.statusCode == 200) {
      print('Logged out success');
      SharedPreferences prefs = await SharedPreferences.getInstance();
//      prefs.remove('user');
      prefs.remove('token');
      Navigator.of(context).pushNamed('home');
    } else {
      print("Error from API code: ${res.statusCode}");
      print(res.body);
    }
  }

//  Future<List<Company>> parseCompanies(String responseBody) {
//    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//
//    return parsed.map<Company>((json) => Company.fromJSON(json)).toList();
//  }
  getCustomersTotal(int company_id) {
    final data = {'company_id': company_id};
    CallApi().postData(data, 'api/customers').then((response) {
      setState(() {
        var res = json.decode(response.body);
        print(res);
        Iterable list = res['cust'];
        _customers = list.map((model) => Customer.fromJSON(model)).toList();
        customersTotal = _customers.length;
      });
    });
  }

  getInvoicesTotal(int company_id) {
    final data = {'company_id': company_id};
    CallApi().postData(data, 'api/customers').then((response) {
      setState(() {
        var res = json.decode(response.body);
        print(res);
        Iterable list = res['cust'];
        _customers = list.map((model) => Customer.fromJSON(model)).toList();
        customersTotal = _customers.length;
      });
    });
  }

  Future<void> _updateData() async {
    tap();
    setState(() {
      _refreshButtonState = false;
      _isLoading = true;
    });

    getCustomersTotal(6);
//
//    var datainvoice = {'company_id': cmp_id, 'customer_id': 1};
//    var invoices = await CallApi().postData(datainvoice, '/api/invoice');
//    if (invoices.statusCode == 200) {
//      var body = json.decode(invoices.body);
//      print(body);
//    } else {
//      print("Error invoice status code: ${invoices.statusCode}");
//    }

//      var test = body['id'];
//      print(test);

//      var nb = getNumberOfInvoices()
//      print(nb);
//      var _data {
//        'company_id' :,
//        'customer_id' :,
//      }
    setState(() {
      _refreshButtonState = true;
      _isLoading = false;
    });
  }

  static Future<void> tap() async {
    await HapticFeedback.heavyImpact();
  }

  void showLogoutDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: const Text(
            'Voulez-vous vraiment vous déconnecter?',
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
                _logout();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Material(
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            PrimaryButton(
                title: Text(_isLoading ? 'Chargement...' : 'Rafraîchir',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 17)),
                isEnabled: _refreshButtonState,
                onPressed: _isLoading ? null : _updateData),
            SizedBox(height: 20.0),
            StatCard(
                title: 'Factures',
                icon: 'invoice_icon_black',
                value: 20,
                color: 0xfffbe48e),
            SizedBox(height: 20.0),
            StatCard(
                title: 'Factures en retard',
                icon: 'invoice_icon_black',
                value: null,
                color: 0xffdcd2fd),
            SizedBox(height: 20.0),
            StatCard(
                title: 'Factures en attente',
                icon: 'invoice_icon_black',
                value: null,
                color: 0xfffdbbbb),
            SizedBox(height: 20.0),
            StatCard(
                title: 'Factures disputées',
                icon: 'invoice_icon_black',
                value: null,
                color: 0xfffdbbbb),
            SizedBox(height: 20.0),
            StatCard(
                title: 'Clients',
                icon: 'avatar_icon_black',
                value: customersTotal,
                color: 0xffdcd2fd),
            SizedBox(height: 20.0),
            StatCard(
                title: 'Prospects actifs',
                icon: 'avatar_icon_black',
                value: null,
                color: 0xffdcd2fd),
            PrimaryButton(
                title: Text("Se déconnecter",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 17)),
                isEnabled: true,
                onPressed: () => showLogoutDialog(context)),
          ],
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
