import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {




    final String url="https://www.arlin.com.sa";
  // final flutterWebviewPlugin = new FlutterWebviewPlugin();

   final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return  
    //SwipeDetector(
    //   child: WebviewScaffold(
    //     url: url,
    //     withJavascript: true,
    //     withZoom: false,
    //     // appBar: AppBar(
    //     //   title: Stack(
    //     //     children: <Widget>[
    //     //       Container(child: Center(child: Text(_title))),
    //     //     ],
    //     //   ),
    //     //   elevation: 1,
    //     // ),
    //   ),
    //   onSwipeDown: () {
    //     flutterWebviewPlugin.reload();
    //   },

    //   swipeConfiguration: SwipeConfiguration(       
    //       verticalSwipeMinVelocity: 100.0,
    //       verticalSwipeMinDisplacement: 50.0,
    //       verticalSwipeMaxWidthThreshold: 100.0,
    //       horizontalSwipeMaxHeightThreshold: 50.0,
    //       horizontalSwipeMinDisplacement: 50.0,
    //       horizontalSwipeMinVelocity: 200.0),
    // );






   WebView(
      initialUrl: url,
         javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },

         
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
   
          gestureNavigationEnabled: true,
        );
  }
     JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  }
