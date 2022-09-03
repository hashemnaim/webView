import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview/web_view.dart';
import 'custom_image.dart';
import 'custom_loading.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 2), (() => Get.off(() => WebViewScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: CustomPngImage(
                  "logo",
                  height: 250,
                  width: 250,
                ),
              ),
            ],
          ),
        ),
        Center(child: CustomLoading()),
        SizedBox(
          height: 80,
        )
      ],
    ));
  }
}
