import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_practice/practice_exampled/evolution/game.dart';
import 'package:flutter_practice/practice_exampled/evolution/grid.dart';
import 'package:flutter_practice/practice_exampled/evolution/row_result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tile.dart';

enum Direction { up, right, down, left }

class Evolution extends StatefulWidget {
  Evolution({Key key}) : super(key: key);

  @override
  _EvolutionState createState() => _EvolutionState();
}

class _EvolutionState extends State<Evolution> {
  List<List<int>> grid = []; // 4 * 4 地图网格
  List<List<int>> gridNew = [];
  SharedPreferences sharedPreferences; // 缓存
  bool gameWon = false;
  bool gameOver = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double gridWidth = (width - 80) / 4;
    double gridHeight = gridWidth;
    double height = (gridHeight * 4) + 40;
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<String>(
          future: getHighScore(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                '最高分:${snapshot.data}',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              );
            } else {
              return Text(
                '最高分:0',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              );
            }
          },
        ),
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
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
              child: Text(
                '分数：' + score.toString(),
                style: TextStyle(fontSize: 36.0),
              ),
            ),
            Container(
              height: height,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      child: GridView.count(
                        primary: false,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        crossAxisCount: 4,
                        children: getGrid(gridWidth, gridHeight),
                      ),
                      onVerticalDragEnd: (DragEndDetails e) {
                        print('垂直移动${e.primaryVelocity}');
                        if (e.primaryVelocity < 0) {
                          handleGesture(Direction.up);
                        } else if (e.primaryVelocity > 0) {
                          handleGesture(Direction.down);
                        }
                      },
                      onHorizontalDragEnd: (DragEndDetails e) {
                        print('水平移动${e.primaryVelocity}');
                        if (e.primaryVelocity < 0) {
                          handleGesture(Direction.right);
                        } else if (e.primaryVelocity > 0) {
                          handleGesture(Direction.left);
                        }
                      },
                    ),
                  ),
                  gameOver
                      ? Container(
                          height: height,
                          color: Colors.white10,
                          child: Center(
                            child: Text(
                              '进化失败！',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                        )
                      : SizedBox(),
                  gameWon
                      ? Container(
                          height: height,
                          color: Colors.white10,
                          child: Center(
                            child: Text(
                              '进化成功！',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  List<Tile> getGrid(double width, double height) {
    List<Tile> grids = [];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        int number = grid[i][j];
        grids.add(Tile(
            number: number,
            width: width,
            height: height,
            color: number == 0
                ? Colors.amber[50]
                : number == 2 || number == 4
                    ? Colors.amber[100]
                    : number == 8 || number == 16
                        ? Colors.amber[200]
                        : number == 32 || number == 64
                            ? Colors.amber[300]
                            : number == 128 || number == 256 || number == 512
                                ? Colors.amber[400]
                                : number == 1024
                                    ? Colors.amber
                                    : Colors.amber[600]));
      }
    }
    return grids;
  }

  handleGesture(Direction direction) {
    // 记录旋转
    bool flipped = false;
    bool transposed = false;
    if (direction == Direction.up) {
      print('up');
      setState(() {
        grid = transposeGrid(grid);
        grid = flipGrid(grid);
        transposed = true;
        flipped = true;
      });
    } else if (direction == Direction.right) {
      print('right');
      setState(() {
        grid = flipGrid(grid);
        flipped = true;
      });
    } else if (direction == Direction.down) {
      print('down');
      setState(() {
        grid = transposeGrid(grid);
        transposed = true;
      });
    } else {
      print('left');
    }
    List<List<int>> past = copyGrid(grid);
    // 每一行操作
    for (int i = 0; i < 4; i++) {
      setState(() {
        // 这里不需要更新状态吧？ 这几个setState测试后都删掉
        RowResult result = operate(grid[i], score, sharedPreferences);
        score = result.score;
        grid[i] = result.row;
      });
    }
    // 这行应该注释掉吧？
    setState(() {
      grid = addNumber(grid, gridNew);
    });
    bool changed = compare(past, grid);
    if (flipped) {
      setState(() {
        grid = flipGrid(grid);
      });
    }
    if (transposed) {
      setState(() {
        grid = transposeGrid(grid);
      });
    }
    if (changed) {
      setState(() {
        grid = addNumber(grid, gridNew);
      });
    }

    if (isGameOver(grid)) {
      setState(() {
        gameOver = true;
      });
    }

    if (isGameWon(grid)) {
      setState(() {
        gameWon = true;
      });
    }
  }

  @override
  void initState() {
    initGame();
    super.initState();
  }

  Future<String> getHighScore() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // return (sharedPreferences.getInt('high_score') | 0).toString();
    int score = sharedPreferences.getInt('high_score');
    if (score == null) {
      score = 0;
    }
    return score.toString();
  }

  moveUp() {}

  moveRight() {}

  moveDown() {}

  moveLeft() {}

  /// 重新开始游戏
  initGame() {
    grid = blankGrid();
    gridNew = blankGrid();
    addNumber(grid, gridNew); // 是引用类型
    addNumber(grid, gridNew);
  }

  startGame() {}

  checkGameOver() {}
}
