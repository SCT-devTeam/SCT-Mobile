import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sct_mobile/core/utils/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:camera/camera.dart';
import 'package:sct_mobile/ui/widgets/primarybutton.dart';
import 'dart:async';
import 'package:sct_mobile/ui/widgets/secondarybutton.dart';
import 'package:sct_mobile/ui/screens/login.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:permission_handler/permission_handler.dart';

//Future<void> main() async {
//  // Ensure that plugin services are initialized so that `availableCameras()`
//  // can be called before `runApp()`
//  WidgetsFlutterBinding.ensureInitialized();
//
//  // Obtain a list of the available cameras on the device.
//  final cameras = await availableCameras();
//
//  // Get a specific camera from the list of available cameras.
//  final firstCamera = cameras.first;
//
//  runApp(
//    MaterialApp(
//      theme: ThemeData.dark(),
//      home: Home(
//          // Pass the appropriate camera to the TakePictureScreen widget.
////        camera: firstCamera,
//          ),
//    ),
//  );
//}
class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => new _ScannerState();
}

//class Home extends StatefulWidget {
//  final CameraDescription camera;
//
//  const Home({
//    Key key,
//    @required this.camera,
//  }) : super(key: key);
//
//  @override
//  _Home createState() => _Home();
//}

class _ScannerState extends State<Scanner> {
//  CameraController _cameraController;
  Future<void> _initializeControllerFuture;
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
//  @override
//  void initState() {
//    super.initState();
//    // To display the current output from the camera,
//    // create a CameraController.
//    _cameraController = CameraController(
//      // Get a specific camera from the list of available cameras.
//      widget.camera,
//      // Define the resolution to use.
//      ResolutionPreset.medium,
//    );
//
//    // Next, initialize the controller. This returns a Future.
//    _initializeControllerFuture = _cameraController.initialize();
//  }

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
                SizedBox(
                  height: 230.0,
                  width: 230.0,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
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
                    onPressed: scan),
              ],
            ),
          ),
        ),
      ),
    );
  }

//  Future scan() async {
//    try {
//      String barcode = await BarcodeScanner.scan();
//      setState(() => this.barcode = barcode);
//    } on PlatformException catch (e) {
//      if (e.code == BarcodeScanner.CameraAccessDenied) {
//        setState(() {
//          this.barcode = 'The user did not grant the camera permission!';
//        });
//      } else {
//        setState(() => this.barcode = 'Unknown error: $e');
//      }
//    } on FormatException {
//      setState(() => this.barcode =
//          'null (User returned using the "back"-button before scanning anything. Result)');
//    } catch (e) {
//      setState(() => this.barcode = 'Unknown error: $e');
//    }
//  }
}
