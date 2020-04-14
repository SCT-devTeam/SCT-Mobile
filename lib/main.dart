import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sct_mobile/ui/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sct_mobile/ui/screens/home.dart';
import 'package:sct_mobile/ui/screens/menu.dart';
import 'package:sct_mobile/ui/shared/sizeConfig.dart';

int initScreen;
bool _isLoggedIn = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print('initScreen ${initScreen}');

  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  runApp(SCT());
}

class SCT extends StatefulWidget {
  @override
  _SCTState createState() => _SCTState();
}

class _SCTState extends State<SCT> {
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    // check if token is there
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != null) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black, statusBarBrightness: Brightness.light));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: Scaffold(
        body: _isLoggedIn ? Menu() : Home(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'SCT App',
      theme: ThemeData(
          // TODO: Create a theme for the app, to easily use different styles
          ),
      // Show onboarding screen only once
      initialRoute: initScreen == 0 || initScreen == null ? "onBoarding" : "",
//      home: _isLoggedIn ? Home() : Menu(),
      routes: {
        'home': (context) => Home(),
        "onBoarding": (context) => OnboardingScreen(),
        "menu": (context) => Menu(),
      },
    );
  }
}
