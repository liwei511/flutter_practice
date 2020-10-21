import 'package:flutter/material.dart';

class NotificationExample extends StatefulWidget {
  NotificationExample({Key key}) : super(key: key);

  @override
  _NotificationExampleState createState() => _NotificationExampleState();
}

class _NotificationExampleState extends State<NotificationExample> {
  String _msg = '';
  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + '  ';
        });
        return true;
      },
      child: Center(
        child: Column(
          children: [
            Builder(
              builder: (context) {
                return RaisedButton(
                  child: Text('send notification'),
                  onPressed: () => MyNotification('Hi').dispatch(context),
                );
              },
            ),
            Text(_msg)
          ],
        ),
      ),
    );
  }
}

// 自定义通知类
class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}
