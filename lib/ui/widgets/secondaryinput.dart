import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SecondaryInput extends StatefulWidget {
  SecondaryInput({@required this.title});
  final String title;

  @override
  _SecondaryInputState createState() => _SecondaryInputState();
}

class _SecondaryInputState extends State<SecondaryInput> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5.0),
        width: 350.0,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          scrollPadding: EdgeInsets.all(30.0),
          decoration: InputDecoration(
            hintText: widget.title,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 3.0),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 3.0),
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
