import 'package:flutter/material.dart';
import 'package:sct_mobile/core/utils/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:camera/camera.dart';
import 'package:sct_mobile/ui/widgets/simplebutton.dart';

main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: Home(
          // Pass the appropriate camera to the TakePictureScreen widget.
//        camera: firstCamera,
          ),
    ),
  );
}

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

class Home extends StatelessWidget {
  CameraController _cameraController;
  Future<void> _initializeControllerFuture;

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
          backgroundColor: Color(0xfff7c91e),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                    'assets/images/sct_logo_colored_squaredWithoutBackgroundAndSubtitle.svg'),
                SizedBox(height: 30.0),
                Container(
                  child: Text(
                    "L'application à besoin de se connecter à une instance de SCT² pour fonctionner",
                    style: sctText,
                  ),
                  padding: const EdgeInsets.all(20.0),
                ),
                SizedBox(height: 30.0),
//                SizedBox(
//                  height: 250.0,
//                  width: 250.0,
//                  child: const DecoratedBox(
//                    decoration: const BoxDecoration(
//                      color: Colors.white,
//                    ),
//                  ),
//                ),
                SizedBox(height: 30.0),
                SimpleButton(
                  title: Text("Je n'ai pas d'instance",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 17)),
                  onPressed: () => print("Hello"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
