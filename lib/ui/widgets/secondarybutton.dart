import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatefulWidget {
  SecondaryButton({@required this.onPressed, this.title});
  final GestureTapCallback onPressed;
  final Widget title;

  @override
  _SecondaryButtonState createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  bool _isPressed = false;

//  GestureTapCallback handleTap(GestureTapCallback onPressed) {
//    setState(() {
//      _isPressed = !_isPressed;
//
//      Future.delayed(const Duration(milliseconds: 100))
//          .then((value) => _isPressed = false);
//    });

//    return onPressed;
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        shadows: [
          BoxShadow(
            blurRadius: 5.0,
            spreadRadius: -3.0,
            color: Colors.black,
            offset: new Offset(0.0, 2.0),
          )
        ],
      ),
      child: RaisedButton(
        onPressed: widget.onPressed,
        textColor: Colors.white,
        hoverColor: Color(0xff1e1ef7),
//        color: (_isPressed ? Colors.blue : Color(0xff4f1ef7)),
        color: Color(0xff4f1ef7),
        padding: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 3.0,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.0),
            topLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(3.0),
          child: widget.title,
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
