import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TertiaryButton extends StatefulWidget {
  TertiaryButton(
      {@required this.onPressed, this.title, @required this.isEnabled});
  final GestureTapCallback onPressed;
  final Widget title;
  bool isEnabled;
//
//  @override
//  void initState() {
//    isEnabled = false;
//  }

  @override
  _TertiaryButtonState createState() => _TertiaryButtonState();
}

class _TertiaryButtonState extends State<TertiaryButton> {
//  void handleTap() {
//    setState(() {
//        _isPressed = !_isPressed;
//
//        Future.delayed(const Duration(milliseconds: 1500))
//            .then((value) => _isPressed = false);
//    });
//  }
//  @override
//  void initState() {
//    widget.isEnabled = false;
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
        onPressed: !widget.isEnabled ? null : widget.onPressed,
//        onPressed: widget.onPressed,
        disabledColor: Color(0xff2f3e55),
        disabledTextColor: Colors.grey,
        textColor: Color(0xff1a1a1a),
        hoverColor: Color(0xff1e1ef7),
//        color: (_isPressed ? Colors.blue : Color(0xff2f3e55)),
        color: Color(0xfff7c91e),
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
