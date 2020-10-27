import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlatformViewExample extends StatelessWidget {
  const PlatformViewExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://www.huayingjuhe.com/#/',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
