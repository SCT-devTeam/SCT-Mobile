import 'package:flutter/material.dart';
import 'package:sct_mobile/ui/screens/onboarding_screen.dart';
import 'package:sct_mobile/ui/shared/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sct_mobile/ui/shared/sizeConfig.dart';
import 'package:sct_mobile/ui/screens/scanner.dart';
import 'package:sct_mobile/ui/widgets/primarybutton.dart';
import 'package:sct_mobile/ui/widgets/secondarybutton.dart';
import 'package:sct_mobile/ui/screens/login.dart';
import 'package:sct_mobile/ui/screens/menu.dart';
import 'package:sct_mobile/ui/screens/noinstance.dart';

main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      title: 'Welcome to SCT',
      home: Center(
        child: Scaffold(
          backgroundColor: Color(0xfff7c91e),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                SizedBox(height: 10.0 * SizeConfig.blockSizeVertical),
                SvgPicture.asset(
                    'assets/images/sct_logo_colored_squaredWithoutBackgroundAndSubtitle.svg',
                    height: 20.0 * SizeConfig.blockSizeVertical,
                    width: 20.0 * SizeConfig.blockSizeHorizontal),
                SizedBox(height: 3.0 * SizeConfig.blockSizeVertical),
                Container(
                  child: Text(
                    "L'application à besoin de se connecter à une instance de SCT² pour fonctionner",
                    style: sctText,
                    textAlign: TextAlign.center,
                  ),
                  padding:
                      const EdgeInsets.all(3.0) * SizeConfig.blockSizeVertical,
                ),
                SizedBox(height: 50.0),
                SecondaryButton(
                  title: Text("Scanner le QR Code",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 17)),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Scanner()),
                  ),
                ),
                SecondaryButton(
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
                  isEnabled: true,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NoInstance()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
