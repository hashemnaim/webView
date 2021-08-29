import 'package:flutter/material.dart';
import 'package:webview/animate_do.dart';
import 'package:webview/isload.dart';
import 'package:webview/web_view.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();

    var delay = Duration(seconds: 3);
    Future.delayed(delay, () {
      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => WebViewExample()),
        ModalRoute.withName('/'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(child: CustomLogo()),
    );
  }
}

class CustomLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlipInX(
            child: FlipInY(
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
      Positioned(bottom: 100, left: 0, right: 0, child: IsLoad())
    ]);
  }
}
