import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sct_mobile/ui/shared/styles.dart';
import 'package:sct_mobile/ui/widgets/cardlogo.dart';

class InvoiceCard extends StatefulWidget {
  InvoiceCard(
      {@required this.title,
      @required this.icon,
      this.price,
      this.date,
      @required this.color});
  final String title;
  final String icon;
  final int price;
  final String date;
  final int color;

  @override
  _InvoiceCardState createState() => _InvoiceCardState();
}

class _InvoiceCardState extends State<InvoiceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          SizedBox(height: 10.0, width: 10.0),
          Container(
              width: 300,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: CardLogo(icon: widget.icon, color: widget.color),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.date,
                          style: sctText,
                        ),
                        Center(
                          child: Text(
                            widget.title,
                            style: sctSubtitleStyleLarge_b,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          widget.price.toString() + "€",
                          style: sctSubtitleStyleLargeBold_b,
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
    );
  }
}

// SHADOW PROPERTIES
// x0 y2 blur5
// 30% black

// SHADOW PROPER ACTIVE
// x0 y1 blur5
// 30% black
