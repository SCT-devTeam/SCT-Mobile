import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sct_mobile/ui/shared/styles.dart';
import 'package:sct_mobile/ui/shared/sizeConfig.dart';
import 'package:sct_mobile/ui/widgets/cardlogo.dart';
import 'package:sct_mobile/core/data/classes/invoice.dart';

class InvoiceCard extends StatelessWidget {
  final Invoice invoice;
  InvoiceCard({@required this.invoice});
  final String icon = 'invoice_icon_black';
  final int color = 0xffdcd2fd;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      child: Row(
        children: <Widget>[
          SizedBox(height: 10.0, width: 10.0),
          Container(
              width: SizeConfig.blockSizeHorizontal * 70,
              height: 150,
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
                        invoice.payment_date != null
                            ? Text(invoice.payment_date, style: sctText)
                            : Text(
                                "null",
                                style: sctText,
                              ),
                        Center(
                          child: Text(
//                            invoice.qualification,
                            'overdue',
                            style: sctSubtitleStyleLarge_b,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          invoice.customer_id.toString() + "€",
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
