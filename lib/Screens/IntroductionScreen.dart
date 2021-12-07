import 'dart:ui';
import 'Login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/foundation.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  // void _onIntroEnd(context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (_) => HomePage()),
  //   );
  // }

  void _onIntroEnd(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return Login();
    }), (Route<dynamic> route) => false);
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('$assetName', width: 250.0),
      alignment: Alignment(0.0, 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Color(0xFF2075BF));

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xFFF9F9F9),
      imagePadding: EdgeInsets.all(20),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Color(0xFFF9F9F9),
      pages: [
        PageViewModel(
          title: "",
          body: "Berbagi dan mengembangkan bersama-sama",
          image: Align(
            child: Image.asset('assets/images/intro-1.png', width: 250.0),
            alignment: Alignment(0.0, 5.0),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          body: "Mencari Kata-kata motivasi tentang pendidikan",
          image: Align(
            child: Image.asset('assets/images/intro-2.png', width: 270.0),
            alignment: Alignment(0.0, 2.0),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          body: "Mendapatkan ide dan inpirasi dengan mudah",
          image: Align(
            child: Image.asset('assets/images/intro3.png', width: 260.0),
            alignment: Alignment(0.0, 2.5),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip',
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF2075BF))),
      next: const Icon(Icons.arrow_forward, color: Color(0xFF2075BF)),
      done: const Text('Done',
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF2075BF))),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xFF2075BF),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
