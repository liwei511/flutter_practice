import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogDemo extends StatelessWidget {
  final String title;
  AlertDialogDemo({Key key, this.title}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RaisedButton(
            child: Text('确认删除对话框'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('提示'),
                      content: Text('确认删除吗'),
                      actions: [
                        FlatButton(
                          child: Text('取消'),
                          onPressed: () {
                            Navigator.of(context).pop('cacel');
                          },
                        ),
                        FlatButton(
                          child: Text('确定'),
                          onPressed: () {
                            Navigator.of(context).pop('ok');
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
          RaisedButton(
            child: Text('IOS风格'),
            onPressed: () => showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text('提示'),
                content: Text('确认删除吗'),
                actions: [
                  CupertinoDialogAction(
                    child: Text('取消'),
                    onPressed: () {
                      Navigator.of(context).pop('cacel');
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text('确定'),
                    onPressed: () {
                      Navigator.of(context).pop('ok');
                    },
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            child: Text('异步对话框'),
            onPressed: () async {
              bool delete = await showDeleteConfireDialog1(context: context);
              if (delete == null) {
                print('取消删除');
              } else {
                print('确认删除');
              }
            },
          ),
          RaisedButton(
            child: Text('选择语言'),
            onPressed: () {
              changeLanguage(context: context);
            },
          )
        ],
      ),
    );
  }

  Future<bool> showDeleteConfireDialog1({
    @required BuildContext context,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('您确定要删除当前文件吗？'),
            actions: [
              FlatButton(
                child: Text('取消'),
                onPressed: () => Navigator.of(context).pop(), // 关掉对话框
              ),
              FlatButton(
                child: Text('删除'),
                onPressed: () => Navigator.of(context).pop(true),
              )
            ],
          );
        });
  }

  Future<void> changeLanguage({@required BuildContext context}) async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('请选择语言'),
            children: [
              SimpleDialogOption(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('中文简体'),
                ),
                onPressed: () => Navigator.pop(context, 1),
              ),
              SimpleDialogOption(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('英语'),
                ),
                onPressed: () => Navigator.pop(context, 2),
              ),
            ],
          );
        });
    if (i != null) {
      print('选择了： ${i == 1 ? "中文简体" : "英语"}');
    }
  }
}
