import 'dart:io';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewScreen> {
  var isDeviceConnected = false;
  // NetworkInfo? networkInfo;
  var listener;
  getNe() async {
    // isDeviceConnected = await networkInfo!.isConnected;
    listener = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          print('You are connected from the internet.');

          isDeviceConnected = true;

          break;
        case InternetConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          isDeviceConnected = false;

          break;
      }
    });
  }

  @override
  void initState() {
    listener = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          print('You are connected from the internet.');
          isDeviceConnected = true;

          setState(() {});

          break;
        case InternetConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
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
      extendBody: true,
      body: isDeviceConnected == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.wifi_off_rounded,
                    size: 200,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "لا يتوفر اتصال بالانترنت",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
            )
          : Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: const WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: 'http://mobile.excodeteam.com/',
                  ),
                ),
              ],
            ),
    );
  }
}
