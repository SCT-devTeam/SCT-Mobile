import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PrimaryInput extends StatefulWidget {
  PrimaryInput({@required this.title});
  final String title;

  @override
  _PrimaryInputState createState() => _PrimaryInputState();
}

class _PrimaryInputState extends State<PrimaryInput> {
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
        margin: EdgeInsets.all(5.0),
        width: 350.0,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
//          border: Border.all(
//            color: Colors.white,
//            width: 2,
//          ),
        ),
        child: TextField(
          scrollPadding: EdgeInsets.all(30.0),
          decoration: InputDecoration(
            hintText: widget.title,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 3.0),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 3.0),
              borderRadius: BorderRadius.circular(50),
            ),
            fillColor: const Color(0xffffffff).withOpacity(0.3),
            filled: true,
          ),
        ));
  }
}

// SHADOW PROPERTIES
// x0 y2 blur5
// 30% black

// SHADOW PROPER ACTIVE
// x0 y1 blur5
// 30% black
