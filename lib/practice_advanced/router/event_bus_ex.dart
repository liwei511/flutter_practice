import 'package:flutter/material.dart';

class EventBusExample extends StatefulWidget {
  EventBusExample({Key key}) : super(key: key);

  @override
  _EventBusExampleState createState() => _EventBusExampleState();
}

class _EventBusExampleState extends State<EventBusExample> {
  var bus = new EventBus();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: PageA(bus: bus),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: PageB(bus: bus),
        ),
      ],
    );
  }
}

class PageA extends StatefulWidget {
  PageA({Key key, this.bus}) : super(key: key);
  final EventBus bus;
  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        height: 100.0,
        child: Row(children: [
          Text("A页面触发事件："),
          FlatButton(
              child: Text('say hi'),
              onPressed: () => widget.bus.emit('login', {'msg': 'hi'})),
          FlatButton(
              child: Text('say hello'),
              onPressed: () => widget.bus.emit('login', {'msg': 'hello'})),
        ]));
  }
}

class PageB extends StatefulWidget {
  PageB({Key key, this.bus}) : super(key: key);
  final EventBus bus;
  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  String msg = 'no message!';
  @override
  Widget build(BuildContext context) {
    // 监听登录事件
    widget.bus.on('login', (arg) {
      setState(() {
        msg = arg.toString();
      });
    });
    return Container(
      alignment: Alignment.topLeft,
      height: 100.0,
      child: Row(
        children: [Text('B页面监听消息：'), Text(msg)],
      ),
    );
  }
}

// 订阅者回调签名
typedef void EventCallback(arg);

// 事件总线
class EventBus {
  // 私有构造函数
  EventBus._internal();

  // 保存单例
  static EventBus _singleton = new EventBus._internal();

  // 工厂构造函数
  factory EventBus() => _singleton;

  // 保存事件订阅队列， key是事件名（id）， value是对应事件的订阅者队列
  var _emap = new Map<Object, List<EventCallback>>();

  // 添加订阅者
  void on(eventName, [EventCallback f]) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(f);
  }

  // 移除订阅者
  void off(eventName, [EventCallback f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  // 触发事件， 事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    for (var i = len; i >= 0; --i) {
      list[i](arg);
    }
  }
}

// 遇到的问题
// const, var, factory, final, static 等关键字含义
