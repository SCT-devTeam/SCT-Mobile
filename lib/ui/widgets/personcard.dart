import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sct_mobile/ui/shared/styles.dart';
import 'package:sct_mobile/ui/widgets/cardlogo.dart';
import 'package:sct_mobile/ui/shared/sizeConfig.dart';
import 'package:sct_mobile/core/data/classes/customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:sct_mobile/ui/screens/newcustomer.dart';

class PersonCard extends StatelessWidget {
  final Customer customer;
  PersonCard({@required this.customer});
  final String icon = 'avatar_icon_black';
  final int color = 0xffdcd2fd;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      child: Card(
        child: Row(
          children: <Widget>[
            SizedBox(height: 10.0, width: 10.0),
            Container(
                width: SizeConfig.blockSizeHorizontal * 70,
                height: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: CardLogo(icon: icon, color: color),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              customer.firstname + ' ' + customer.lastname,
                              style: sctText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          customer.status != null
                              ? Text(customer.status, style: sctText)
                              : Text(
                                  "null",
                                  style: sctText,
                                ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.0),
            topLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          ),
        ),
      ),
      onTap: () => Navigator.of(context).push(
        CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => NewCustomer(title: "Modifier un client")),
      ),
    );
  }
}

// SHADOW PROPERTIES
// x0 y2 blur5
// 30% black

// SHADOW PROPER ACTIVE
// x0 y1 blur5
// 30% black
