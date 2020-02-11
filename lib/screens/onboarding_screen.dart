import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sct_mobile/utilities/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xff4f1ef7),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xfff7c91e),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => print('Skip'),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xff1a1a1a),
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                        // Changer la couleur de l'arrière plan du onboarding
                        switch (page) {
                          case 0:
                            {
                              print('0');
                            }
                            break;
                          case 1:
                            {
                              print('1');
                            }
                            break;
                          case 2:
                            {
                              print('2');
                            }
                            break;
                        }
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Gérez vos client',
                              style: sctTitleStyleLarge,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 70.0),
                            Center(
                              child: SvgPicture.asset(
                                'assets/images/contactsAroundMan_illustration_colored.svg',
                                placeholderBuilder: (context) =>
                                    CircularProgressIndicator(),
                                height: 280.0,
                                width: 280.0,
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: sctSubtitleStyleMed,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Gérez vos factures',
                              style: sctTitleStyleLarge,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 70.0),
                            Center(
                              child: SvgPicture.asset(
                                'assets/images/invoicesBehindWoman_illustration_colored.svg',
                                placeholderBuilder: (context) =>
                                    CircularProgressIndicator(),
                                height: 280.0,
                                width: 280.0,
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: sctSubtitleStyleMed,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Le tout dans un compagnon intelligent!',
                              style: sctTitleStyleMed,
                              textAlign: TextAlign.center,
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(height: 80.0),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.check,
                                      color: Color(0xfff7c91e),
                                      size: 24.0,
                                      semanticLabel: 'Checkmark',
                                    ),
                                    SizedBox(width: 20.0),
                                    Text(
                                      'Statistiques',
                                      style: sctSubtitleStyleLarge,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 40.0),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.check,
                                      color: Color(0xfff7c91e),
                                      size: 24.0,
                                      semanticLabel: 'Checkmark',
                                    ),
                                    SizedBox(width: 20.0),
                                    Text(
                                      'Gestion des status\n client / facture',
                                      style: sctSubtitleStyleLarge,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 40.0),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.check,
                                      color: Color(0xfff7c91e),
                                      size: 24.0,
                                      semanticLabel: 'Checkmark',
                                    ),
                                    SizedBox(width: 20.0),
                                    Text(
                                      'Automatisation des tâches\nfastidieuses',
                                      style: sctSubtitleStyleLarge,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 40.0),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.check,
                                      color: Color(0xfff7c91e),
                                      size: 24.0,
                                      semanticLabel: 'Checkmark',
                                    ),
                                    SizedBox(width: 20.0),
                                    Text(
                                      'Exports simple et rapide',
                                      style: sctSubtitleStyleLarge,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Color(0xff1a1a1a),
                                    fontSize: 22.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xff1a1a1a),
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () => print('Get started'),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      "J'ai compris",
                      style: TextStyle(
                        color: Color(0xff4f1ef7),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
