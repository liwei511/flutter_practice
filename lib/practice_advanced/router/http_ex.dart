import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class HttpExample extends StatefulWidget {
  HttpExample({Key key}) : super(key: key);

  @override
  _HttpExampleState createState() => _HttpExampleState();
}

/*
 *Android 和 IOS 端使用的是
 *IOWebSocketChannel.connect(connectUrl); 
 *对于 Web 端来说应该使用的是
 *HtmlWebSocketChannel.connect(connectUrl); 
 */

class _HttpExampleState extends State<HttpExample> {
  bool _loading = false;
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            RaisedButton(
              child: Text('获取huayingjuhe首页'),
              onPressed: _loading
                  ? null
                  : () async {
                      setState(() {
                        _loading = true;
                        _text = '正在请求...';
                      });
                      try {
                        HttpClient httpClient = new HttpClient();
                        HttpClientRequest request = await httpClient
                            .getUrl(Uri.parse('https://www.huayingjuhe.com'));

                        request.headers.add('user-agent',
                            'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');

                        HttpClientResponse response = await request.close();
                        _text = await response.transform(utf8.decoder).join();

                        httpClient.close();
                      } catch (e) {
                        _text = '请求失败: $e';
                      } finally {
                        _loading = false;
                      }
                    },
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(_text.replaceAll(RegExp(r'\s'), '')),
            )
          ],
        ),
      ),
    );
  }
}
