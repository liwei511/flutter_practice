import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

class ListViewDemo extends StatefulWidget {
  ListViewDemo({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<ListViewDemo> {
  static const loadingTag = '##loading##';
  List _words = <String>[loadingTag];

  void initState() {
    super.initState();
  }

  void _retrieveDate() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _words.insertAll(_words.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Scrollbar(
          // 有滚动条
          child: ListView.separated(
            itemCount: _words.length,
            itemBuilder: (context, index) {
              if (_words[index] == loadingTag) {
                if (_words.length - 1 < 100) {
                  _retrieveDate();
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '没有更多了',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }
              }
              return ListTile(title: Text(_words[index]));
            },
            separatorBuilder: (context, index) => Divider(
              height: .0,
            ),
          ),
        ));
  }
}
