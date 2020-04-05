import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sct_mobile/ui/shared/styles.dart';
import 'package:sct_mobile/ui/widgets/primarybutton.dart';
import 'package:sct_mobile/ui/widgets/secondarybutton.dart';
import 'package:sct_mobile/ui/screens/login.dart';
import 'dart:async';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => new _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String barcode = "";
  String result = "";

  Future scan() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }

    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to SCT',
      home: Center(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xfff7c91e),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          backgroundColor: Color(0xfff7c91e),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10.0),
                Container(
                  width: 400.0,
                  child: Text(
                    "Rendez vous dans les paramètres de votre compte rubrique \"Associer l'application companion\" pour générer le QR code",
                    style: sctText,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 100.0),
                PrimaryButton(
                    title: Text("Ouvrir la caméra",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 17)),
                    onPressed: scan),
                SizedBox(height: 80.0),
                Container(
                  width: 400.0,
                  child: Text(
                    result,
                    style: sctText,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 80.0),
                PrimaryButton(
                  title: Text("Utiliser ses identifiants",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 17)),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  ),
                ),
                PrimaryButton(
                    title: Text("Je n'ai pas d'instance",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 17)),
                    onPressed: () => print("Je n'ai pas d'instance")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
