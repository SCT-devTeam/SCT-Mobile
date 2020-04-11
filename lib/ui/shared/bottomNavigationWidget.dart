import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sct_mobile/ui/screens/newcustomer.dart';
import 'package:sct_mobile/ui/screens/onboarding_screen.dart';
import 'package:sct_mobile/ui/shared/sizeConfig.dart';
import 'package:sct_mobile/core/viewmodels/bottomNavigationBar_Model.dart';
import 'package:sct_mobile/ui/screens/receiptbook.dart';
import 'package:sct_mobile/ui/screens/writings.dart';
import 'package:sct_mobile/ui/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:sct_mobile/ui/screens/customers.dart';

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({Key key}) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final currentTab = [
    Dashboard(),
    CustomersPage(),
    WritingsPage(),
    ReceiptBook(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xfff7c91e),
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              title: Padding(
                  padding: EdgeInsets.all(10.0), child: Text("Dashboard"))),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Padding(
                  padding: EdgeInsets.all(10.0), child: Text("Clients"))),
          BottomNavigationBarItem(
              icon: Icon(Icons.description),
              title: Padding(
                  padding: EdgeInsets.all(10.0), child: Text("Écritures"))),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Padding(
                  padding: EdgeInsets.all(10.0), child: Text("Recettes"))),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: provider.currentIndex == 1
          ? FloatingActionButton(
              backgroundColor: Color(0xfff7c91e),
              onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => NewCustomer()),
              ),
              child: new Icon(
                Icons.add,
                size: 30.0,
              ),
            )
          : null,
    );
  }
}
