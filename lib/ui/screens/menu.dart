import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sct_mobile/core/viewmodels/bottomNavigationBar_Model.dart';
import 'package:sct_mobile/ui/shared/bottomNavigationWidget.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavigationBarProvider>(
      create: (_) => BottomNavigationBarProvider(),
      child: Scaffold(
          backgroundColor: Color(0xfffafafa),
          body: SafeArea(
              bottom: false,
              child: Stack(children: <Widget>[BottomNavigationWidget()]))),
    );
  }
}
