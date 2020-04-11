import 'package:flutter/material.dart';
import 'package:sct_mobile/ui/shared/sizeConfig.dart';
import 'package:sct_mobile/ui/shared/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sct_mobile/ui/screens/scanner.dart';
import 'package:sct_mobile/ui/widgets/primarybutton.dart';
import 'package:sct_mobile/ui/widgets/secondarybutton.dart';
import 'package:sct_mobile/ui/widgets/tertiarybutton.dart';
import 'package:sct_mobile/ui/screens/login.dart';
import 'package:sct_mobile/ui/screens/menu.dart';
import 'package:sct_mobile/ui/screens/noinstance.dart';
import 'package:sct_mobile/ui/widgets/tertiarybutton.dart';

class NoInstance extends StatefulWidget {
  @override
  _NoInstanceState createState() => _NoInstanceState();
}

class _NoInstanceState extends State<NoInstance> {
  _launchURL() async {
    const url = 'https://github.com/SCT-devTeam/SCT-Backend';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to SCT',
      home: Center(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xff1c2841),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          backgroundColor: Color(0xff1c2841),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                    'assets/images/sct_logo_colored_squaredWithoutBackgroundAndSubtitleInverted.svg',
                    height: 20.0 * SizeConfig.blockSizeVertical,
                    width: 20.0 * SizeConfig.blockSizeHorizontal),
                SizedBox(height: 30.0),
                Container(
                  child: Text(
                    "Pour utiliser l'application vous devez avoir une instance du service",
                    style: sctSubtitleStyleMed_w,
                    textAlign: TextAlign.center,
                  ),
                  padding: const EdgeInsets.all(20.0),
                ),
                SizedBox(height: 2.0 * SizeConfig.blockSizeVertical),
                TertiaryButton(
                  title: Text("Commander une instance",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 17)),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Scanner()),
                  ),
                  isEnabled: true,
                ),
                PrimaryButton(
                  title: Text("Créer son instance soi-même",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 17)),
                  onPressed: _launchURL,
                  isEnabled: true,
                ),
                PrimaryButton(
                  title: Text("Retour à la connexion",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 17)),
                  isEnabled: true,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
