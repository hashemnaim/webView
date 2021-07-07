import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview/isload.dart';
import 'package:webview/web_viwe.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();

    var delay = Duration(seconds: 1);
    Future.delayed(delay, () {
      Get.offAll(WebViewExample());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(child: CustomLogo()),
    );
  }
}

class CustomLogo extends StatelessWidget {
  // CustomLogo({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/splash_screen.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      Positioned(bottom: 100, left: 0, right: 0, child: IsLoad())
    ]);
  }
}
