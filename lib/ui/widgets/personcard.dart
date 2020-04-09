import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sct_mobile/ui/shared/styles.dart';
import 'package:sct_mobile/ui/widgets/cardlogo.dart';

class PersonCard extends StatefulWidget {
  PersonCard(
      {@required this.title,
      @required this.icon,
      this.value,
      @required this.color});
  final String title;
  final String icon;
  final int value;
  final int color;

  @override
  _PersonCardState createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          SizedBox(height: 10.0, width: 10.0),
          Container(
              width: 300,
              height: 110,
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
                        Center(
                          child: Text(
                            widget.title,
                            style: sctText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          widget.value.toString(),
                          style: sctSubtitleStyleMedBold_b,
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
