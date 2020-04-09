import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sct_mobile/ui/widgets/primarybutton.dart';
import 'package:sct_mobile/ui/widgets/statcard.dart';
import 'package:http/http.dart';
import 'package:sct_mobile/core/data/models/api.dart';
import 'package:sct_mobile/ui/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void _logout() async {
    // logout from the server ...
    SharedPreferences prefs = await SharedPreferences.getInstance();
//      prefs.remove('user');
    prefs.remove('token');
    Navigator.popAndPushNamed(context, 'home');
    print("Logged out");
  }

  void showLogoutDialog(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: const Text(
            'Souhaitez vous vraiment vous déconnecter?',
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
                value: null,
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
