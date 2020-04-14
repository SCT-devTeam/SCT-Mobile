import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sct_mobile/ui/shared/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sct_mobile/ui/screens/scanner.dart';
import 'package:sct_mobile/ui/screens/menu.dart';
import 'package:sct_mobile/ui/screens/noinstance.dart';
import 'package:sct_mobile/ui/widgets/primarybutton.dart';
import 'package:sct_mobile/ui/shared/sizeConfig.dart';
import 'package:validate/validate.dart';
import 'package:sct_mobile/core/data/models/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  bool _isLoading = false;
  bool _connectButtonState = true;
  bool _wrongCredentials = false;
  ScaffoldState scaffoldState;

  var _urlController = TextEditingController();
  var _mailController = TextEditingController();
  var _passwordController = TextEditingController();

  final FocusNode _urlFocus = FocusNode();
  final FocusNode _mailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

//  _showMsg(msg) {
//    //
//    print(msg);
//    final snackBar = SnackBar(
//      content: Text(msg),
//      action: SnackBarAction(
//        label: 'Close',
//        onPressed: () {
//          // Some code to undo the change!
//        },
//      ),
//    );
//    Scaffold.of(context).showSnackBar(snackBar);
//  }

  String _validateEmail(String value) {
    setState(() {
      _wrongCredentials = false;
    });
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'L\'adresse email n\'est pas valide.';
    }
    return null;
  }

  String _validatePassword(String value) {
    setState(() {
      _wrongCredentials = false;
    });
    if (value.isEmpty) {
      return 'Veuillez renseigner le mot de passe';
    }
    return null;
  }

  void submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();
      _login();
    }
  }

  Widget build(BuildContext context) {
    _fieldFocusChange(
        BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

    SizeConfig().init(context);

    return Center(
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
        body: Form(
          key: this._formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30.0),
//              mainAxisAlignment: MainAxisAlignment.,
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                    'assets/images/sct_logo_colored_squaredWithoutBackgroundAndSubtitle.svg',
                    height: 20.0 * SizeConfig.blockSizeVertical,
                    width: 20.0 * SizeConfig.blockSizeHorizontal),
                SizedBox(height: 5.0 * SizeConfig.blockSizeVertical),
                Text(
                    _wrongCredentials
                        ? 'Mauvais identifiant / mot de passe'
                        : '',
                    style: TextStyle(color: Colors.red)),
                SizedBox(height: 10.0),
//                TextFormField(
//                  enabled: false,
//                  controller: _urlController,
//                  autovalidate: true,
//                  textInputAction: TextInputAction.next,
//                  keyboardType: TextInputType.url,
//                  focusNode: _urlFocus,
//                  onFieldSubmitted: (term) {
//                    _fieldFocusChange(context, _urlFocus, _mailFocus);
//                  },
//                  scrollPadding: EdgeInsets.all(30.0),
//                  decoration: InputDecoration(
//                    hintText: "URL de l'instance",
//                    enabledBorder: OutlineInputBorder(
//                      borderSide:
//                          const BorderSide(color: Colors.white, width: 3.0),
//                      borderRadius: BorderRadius.circular(50),
//                    ),
//                    focusedBorder: OutlineInputBorder(
//                      borderSide:
//                          const BorderSide(color: Colors.black, width: 3.0),
//                      borderRadius: BorderRadius.circular(50),
//                    ),
//                    fillColor: const Color(0xffffffff).withOpacity(0.3),
//                    filled: true,
//                  ),
//                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: _mailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: this._validateEmail,
                  focusNode: _mailFocus,
                  onFieldSubmitted: (term) {
                    _fieldFocusChange(context, _mailFocus, _passwordFocus);
                  },
                  scrollPadding: EdgeInsets.all(30.0),
                  decoration: InputDecoration(
                    hintText: "Adresse email",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 3.0),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 3.0),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    fillColor: const Color(0xffffffff).withOpacity(0.3),
                    filled: true,
                  ),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  focusNode: _passwordFocus,
                  onFieldSubmitted: (value) {
                    _passwordFocus.unfocus();
//                      submit();
//                      _calculator();
                  },
                  keyboardType: TextInputType.visiblePassword,
                  validator: this._validatePassword,
                  scrollPadding: EdgeInsets.all(30.0),
                  decoration: InputDecoration(
                    hintText: "Mot de passe",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 3.0),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 3.0),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    fillColor: const Color(0xffffffff).withOpacity(0.3),
                    filled: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
//                    SizedBox(width: 30.0 * SizeConfig.blockSizeHorizontal),
                    PrimaryButton(
                        title: Text(
                            _isLoading ? 'Connexion...' : 'Se connecter',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 17)),
                        isEnabled: _connectButtonState,
                        onPressed: _isLoading ? null : submit),
                  ],
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

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'email': _mailController.text,
      'password': _passwordController.text,
      'device_name': 'Mobile App'
    };

    var res = await CallApi().postData(data, 'api/airlock/login');
    if (res.statusCode == 200) {
      var body = json.decode(res.body);
      if (body.containsKey('token')) {
        print('Login success');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', body['token']);
        print(prefs.getString('token'));
//      prefs.setString('user', json.encode(body['user']));
        Navigator.of(context).pushNamed('menu');
      } else {
        print("Error: No token found");
      }
    } else {
      print("Error status code: ${res.statusCode}");
      setState(() {
        _isLoading = false;
        _connectButtonState = true;
        _wrongCredentials = true;
      });
    }
  }
}
