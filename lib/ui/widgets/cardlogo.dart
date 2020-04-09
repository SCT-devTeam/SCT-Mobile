import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sct_mobile/ui/shared/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardLogo extends StatelessWidget {
  CardLogo({@required this.icon, @required this.color});
  final String icon;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SvgPicture.asset(
          'assets/images/$icon.svg',
          height: 40.0,
          width: 40.0,
        ),
      ),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          color: Color(color),
          borderRadius: BorderRadius.all(Radius.circular(80))),
    );
  }
}

// SHADOW PROPERTIES
// x0 y2 blur5
// 30% black

// SHADOW PROPER ACTIVE
// x0 y1 blur5
// 30% black
