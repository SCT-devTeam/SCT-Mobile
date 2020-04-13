import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sct_mobile/ui/shared/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sct_mobile/ui/screens/home.dart';
import 'package:sct_mobile/ui/shared/sizeConfig.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _numPages = 3;
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Animatable<Color> _background;

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  void _initialize() {
    _background = TweenSequence<Color>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Color(0xfff7c91e),
          end: Color(0xff2f3e55),
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Color(0xff2f3e55),
          end: Color(0xff1C2841),
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Color(0xff1C2841),
          end: Colors.blue[400],
        ),
      ),
    ]);
    _pageController = PageController();
  }

//  @override
//  void reassemble() {
//    _pageController.dispose();
//    _initialize();
//    super.reassemble();
//  }

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
      body: AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          final color =
              _pageController.hasClients ? _pageController.page / 3 : .0;
          return DecoratedBox(
            decoration: BoxDecoration(
              color: _background.evaluate(AlwaysStoppedAnimation(color)),
            ),
            child: child,
          );
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // TODO: Make skip button redirect to the home and disappear on the third page
//                  Container(
//                    alignment: Alignment.centerRight,
//                    child: FlatButton(
//                      onPressed: () => print('Skip'),
//                      child: Text(
//                        'Skip',
//                        style: TextStyle(
//                          color: Color(0xff1a1a1a),
//                          fontSize: 20.0,
//                        ),
//                      ),
//                    ),
//                  ),
                  Container(
                    height: 600.0,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Gérez vos\nclients',
                                style: sctTitleStyleLarge_b,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 90.0),
                              Center(
                                child: SvgPicture.asset(
                                  'assets/images/contactsAroundMan_illustration_colored.svg',
                                  height: 280.0,
                                  width: 280.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Gérez vos\nfactures',
                                style: sctTitleStyleLarge_w,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 90.0),
                              Center(
                                child: SvgPicture.asset(
                                  'assets/images/invoicesBehindWoman_illustration_colored.svg',
                                  height: 280.0,
                                  width: 280.0,
                                ),
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
                                style: sctTitleStyleMed_w,
                                textAlign: TextAlign.center,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(height: 100.0),
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
                                        style: sctSubtitleStyleLarge_w,
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
                                        style: sctSubtitleStyleLarge_w,
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
                                        style: sctSubtitleStyleLarge_w,
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
                                        style: sctSubtitleStyleLarge_w,
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
                  Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
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
                                  // TODO: Make next button change color to white on second page
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
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 90.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(builder: (context) => new Home()));
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
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
