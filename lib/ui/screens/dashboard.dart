import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sct_mobile/ui/widgets/primarybutton.dart';
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
        child: Stack(
          children: <Widget>[
            Center(child: Text("Page du Dashboard")),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "",
                style:
                    new TextStyle(fontSize: 24.0, color: Colors.grey.shade700),
              ),
            ),
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
