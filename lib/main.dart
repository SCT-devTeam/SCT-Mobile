import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sct_mobile/ui/screens/onboarding_screen.dart';

void main() {
  runApp(new MaterialApp(
    home: new SCT(),
  ));
}

//class SCT extends StatefulWidget {
////  @override
////  _MyAppState createState() => new _MyAppState();
////}

class SCT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

//    return Provider<AuthenticationProvider>(
//        builder: (_) => AuthenticationProvider(),
//    dispose: (_, model) => model.dispose(),
//    child: Consumer<AuthenticationProvider>(
//    builder: (_, AuthenticationProvider authenticationProvider, __) {
//    return MultiProvider(
//    providers: <SingleChildCloneableWidget>[
//    Provider<ChatProvider>(
//    builder: (_) => ChatProvider(authenticationProvider: authenticationProvider),
//    dispose: (_, ChatProvider provider) => provider.dispose(),
//    ),
//    Provider<ResourcesProvider>(
//    builder: (_) => ResourcesProvider(authenticationProvider: authenticationProvider),
//    dispose: (_, ResourcesProvider provider) => provider.dispose(),
//    ),
//    ],

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCT App',
      theme: ThemeData(
          // TODO: Create a theme for the app, to easily use different styles
          ),
      home: OnboardingScreen(),
      // TODO: Make the Onboarding screen appear only once after installation
    );
  }
}
//class _MyAppState extends State<SCT> {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Onboarding',
//      debugShowCheckedModeBanner: false,
//      home: OnboardingScreen(),
//    );
//  }
//}
