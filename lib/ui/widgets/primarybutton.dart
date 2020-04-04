import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  PrimaryButton({@required this.onPressed, this.title});
  final GestureTapCallback onPressed;
  final Widget title;

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isPressed = false;

//  void handleTap() {
//    setState(() {
//        _isPressed = !_isPressed;
//
//        Future.delayed(const Duration(milliseconds: 1500))
//            .then((value) => _isPressed = false);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
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
//        color: (_isPressed ? Colors.blue : Color(0xff2f3e55)),
        color: Color(0xff2f3e55),
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
