import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sct_mobile/ui/widgets/primarybutton.dart';
import 'package:sct_mobile/ui/widgets/statcard.dart';
import 'package:sct_mobile/core/data/models/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';
import 'package:sct_mobile/core/data/classes/invoice.dart';
import 'package:sct_mobile/core/data/classes/customer.dart';

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

  List<Customer> _customers = <Customer>[];
  List<Invoice> _invoices = <Invoice>[];

  void _logout() async {
    var res = await CallApi().getData('api/logout');
    print(res.body);
    if (res.statusCode == 200) {
      print('Logged out success');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      Navigator.of(context).pushNamed('home');
    } else {
      print("Error from API code: ${res.statusCode}");
      print(res.body);
    }
  }

  getCustomersTotal(int company_id) {
    final data = {'id_company': company_id};
    CallApi().postData(data, 'api/customers').then((response) {
      setState(() {
        var res = json.decode(response.body);
        Iterable list = res['cust'];
        _customers = list.map((model) => Customer.fromJSON(model)).toList();
        customersTotal = _customers.length;
      });
    });
  }

  getInvoicesTotal() {
    CallApi().getData('api/allInvoice').then((response) {
      setState(() {
        var res = json.decode(response.body);
        Iterable list = res['invoices'];
        _invoices = list.map((model) => Invoice.fromJSON(model)).toList();
        invoicesTotal = _invoices.length;
      });
    });
  }

  Future<void> _updateData() async {
    tap();
    setState(() {
      _refreshButtonState = false;
      _isLoading = true;
    });

    var company_id = await CallApi().getCompanyId();

    getCustomersTotal(company_id);

    getInvoicesTotal();

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
  void initState() {
    super.initState();

    _updateData();
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
                value: invoicesTotal,
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
