import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  TicTacToe({Key key}) : super(key: key);

  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<String> squares = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ];
  bool xIsNext = true;
  String status = 'X先走';
  String winner = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            FlatButton.icon(
              label: Text('重新开始'),
              icon: Icon(Icons.repeat),
              onPressed: () {
                // 重新开始
              },
            ),
            FlatButton.icon(
              label: Text('回退'),
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // 回退
              },
            ),
          ],
        ),
        body: Center(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
              child: Text(
                status,
                style: TextStyle(fontSize: 36.0),
              ),
            ),
            Container(
              width: 600.0,
              height: 600.0,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                children: squares
                    .asMap()
                    .map((index, e) => MapEntry(
                        index,
                        RaisedButton(
                          child: Text(e == null ? '' : e),
                          onPressed: () {
                            if (e == null && winner == null) {
                              setState(() {
                                squares[index] = xIsNext ? 'X' : 'O';
                                xIsNext = !xIsNext;
                                winner = calculateWinner();
                                if (winner != null) {
                                  status = '$winner赢得了游戏';
                                } else {
                                  status = '轮到${xIsNext ? 'X' : 'O'}了';
                                }
                              });
                            }
                          },
                        )))
                    .values
                    .toList(),
              ),
            ),
          ]),
        ));
  }

  String calculateWinner() {
    List<List<int>> lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (int i = 0; i < lines.length; i++) {
      int a = lines[i][0];
      int b = lines[i][1];
      int c = lines[i][2];
      if (squares[a] != null &&
          squares[a] == squares[b] &&
          squares[a] == squares[c]) {
        return squares[a];
      }
    }
    return null;
  }
}
