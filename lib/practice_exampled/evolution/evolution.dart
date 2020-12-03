import 'dart:math';

import 'package:flutter/material.dart';

class Evolution extends StatefulWidget {
  Evolution({Key key}) : super(key: key);

  @override
  _EvolutionState createState() => _EvolutionState();
}

class _EvolutionState extends State<Evolution> {
  List<List<int>> bound; // 4 * 4 地图
  bool isNewRandNum;
  bool isGameOver;
  int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton.icon(
            label: Text('重玩'),
            icon: Icon(Icons.repeat),
            onPressed: () {
              initGame();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
              child: Text(
                '分数：' + score.toString(),
                style: TextStyle(fontSize: 36.0),
              ),
            ),
            GestureDetector(
              child: Container(width: 600.0, height: 600.0, child: Text('A')),
              onPanDown: (DragDownDetails e) {
                print('down:${e.globalPosition}');
              },
              onPanUpdate: (DragUpdateDetails e) {
                print('update:${e.delta.dx} ${e.delta.dy}');
              },
              onPanEnd: (DragEndDetails e) {
                print('down:${e.velocity}');
              },
            )
          ],
        ),
      ),
    );
  }

  moveUp() {
    randNum();
  }

  moveRight() {
    randNum();
  }

  moveDown() {
    randNum();
  }

  moveLeft() {
    randNum();
  }

  // 空的格子个数
  getZeroCount() {
    var count = 0;
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        if (bound[i][j] == 0) {
          count++;
        }
      }
    }
    return count;
  }

  // 生成随机数
  randNum() {
    // 小于getZeroCount的随机数
    int n = Random(10) as int;
    print(Random(10));
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        if (n == 0) {
          // 随机数 random % 3 ? 2 : 4
          bound[i][j] = 2;
          break;
        }
        if (bound[i][j] == 0) {
          n--;
        }
      }
    }
    setState(() {});
  }

  initGame() {
    randNum();
    randNum();
  }

  startGame() {}

  checkGameOver() {}
}
