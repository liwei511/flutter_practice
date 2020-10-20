import 'package:flutter/material.dart';

class BaseWidgetDemo extends StatelessWidget {
  BaseWidgetDemo({Key key, this.title}) : super(key: key);

  final String title;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'textAlign：文本的对齐方式；可以选择左对齐、右对齐还是居中。注意，对齐的参考系是Text widget本身。本例中虽然是指定了各种对齐，但因为Text文本内容宽度不足一行，Text的宽度和文本内容长度相等，那么这时指定对齐方式是没有意义的，只有Text宽度大于文本内容长度时指定此属性才有意义。',
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Hello Flutter' * 6,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Hello Flutter',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 22,
                      height: 1.2,
                      fontFamily: 'Courier',
                      background: Paint()..color = Colors.yellow,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed),
                ),
                Text(
                  'Hello Flutter' * 5,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 1.5,
                ),
                Text.rich(TextSpan(text: 'TextSpan:不同部分不同样式', children: [
                  TextSpan(
                    text: 'small',
                    style: TextStyle(fontSize: 10),
                  ),
                  TextSpan(
                    text: 'default',
                  ),
                  TextSpan(
                    text: 'big',
                    style: TextStyle(fontSize: 22),
                  )
                ])),
                RaisedButton(child: Text('RaisedButton'), onPressed: () {}),
                RaisedButton(
                  child: Text('RaisedButton No Event'), onPressed: null),
                FlatButton(onPressed: () {}, child: Text('FlatButton')),
                OutlineButton(onPressed: () {}, child: Text('OutlineButton')),
                IconButton(icon: Icon(Icons.thumb_up), onPressed: () {}),
                RaisedButton.icon(
                  icon: Icon(Icons.send),
                  label: Text('带图标'),
                  onPressed: () {}),
                FlatButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  highlightColor: Colors.blue[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {},
                  child: Text('FlatButton')),
                Image(
                  image: AssetImage('assets/images/350x150.png'), width: 350),
                Icon(Icons.fingerprint, color: Colors.deepOrange),
                Switch(value: false, onChanged: (value) {
                  print(value);
                }),
                Checkbox(value: true, onChanged: (value) {
                  print(value);
                })
              ],
            ),
          ),
        ));
  }
}
