import 'dart:io';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewScreen> {
  var isDeviceConnected = true;
  WebViewController? webViewControllertro;

  var listener;

  getSetStat() {
    webViewControllertro!.reload();
  }

  @override
  void initState() {
    listener = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          isDeviceConnected = true;

          setState(() {});

          break;
        case InternetConnectionStatus.disconnected:
          isDeviceConnected = false;
          setState(() {});
          break;
      }
    });

    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: WebView(
            key: UniqueKey(),
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'http://mobile.excodeteam.com/',
            // gestureNavigationEnabled: true,
            onWebViewCreated: (WebViewController controller) {
              // webViewControllertro!.complete(controller);
              webViewControllertro = controller;
            },
          ),
        ),
      ),
    );
  }
}
