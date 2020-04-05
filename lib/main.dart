import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sct_mobile/ui/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sct_mobile/ui/screens/home.dart';

int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(SCT());
}

class SCT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCT App',
      theme: ThemeData(
          // TODO: Create a theme for the app, to easily use different styles
          ),
      // Show onboarding screen only once
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      routes: {
        '/': (context) => Home(),
        "first": (context) => OnboardingScreen(),
      },
    );
  }
}
