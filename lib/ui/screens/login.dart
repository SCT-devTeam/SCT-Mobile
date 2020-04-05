import 'package:flutter/material.dart';
import 'package:sct_mobile/ui/shared/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sct_mobile/ui/screens/scanner.dart';
import 'package:sct_mobile/ui/widgets/primarybutton.dart';
import 'package:sct_mobile/ui/widgets/primaryinput.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to SCT',
      home: Center(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xfff7c91e),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          backgroundColor: Color(0xfff7c91e),
          body: Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(30.0),
//              mainAxisAlignment: MainAxisAlignment.,
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                      'assets/images/sct_logo_colored_squaredWithoutBackgroundAndSubtitle.svg'),
                  SizedBox(height: 40.0),
                  PrimaryInput(title: "URL de l'instance"),
                  PrimaryInput(title: "Adresse email"),
                  PrimaryInput(title: "Mot de passe"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(width: 200.0),
                      PrimaryButton(
                        title: Text("Se connecter",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 17)),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Scanner()),
                        ),
                      ),
                    ],
                  ),
                  PrimaryButton(
                    title: Text("Je n'ai pas d'instance",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 17)),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Scanner()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
