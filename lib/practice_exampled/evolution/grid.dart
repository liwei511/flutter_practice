import 'point.dart';
import 'dart:math';

/// 4*4空grid， 当通关时变5乘5试试
List<List<int>> blankGrid() {
  List<List<int>> grid = [];
  for (int i = 0; i < 4; i++) {
    List<int> row = [];
    for (int j = 0; j < 4; j++) {
      row.add(0);
    }
    grid.add(row);
  }
  return grid;
}

bool compare(List<List<int>> a, List<List<int>> b) {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (a[i][j] != b[i][j]) {
        return false;
      }
    }
  }
  return true;
}

List<List<int>> copyGrid(List<List<int>> grid) {
  List<List<int>> newGrid = blankGrid();
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      newGrid[i][j] = grid[i][j];
    }
  }
  return newGrid;
}

///  翻转是为了便于计算，无论什么方向滑动都转成水平向右滑动计算
List<List<int>> flipGrid(List<List<int>> grid) {
  for (int i = 0; i < 4; i++) {
    List<int> row = grid[i];
    grid[i] = row.reversed.toList();
  }
  return grid;
}

/// 对角线反转
List<List<int>> transposeGrid(List<List<int>> grid) {
  List<List<int>> newGrid = blankGrid();
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      newGrid[i][j] = grid[j][i];
    }
  }
  return newGrid;
}

/// 再为0的随机瓦片上填充数字2或4， 2的概率大一些. gridNew?
List<List<int>> addNumber(List<List<int>> grid, List<List<int>> gridNew) {
  List<Point> points = [];
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (grid[i][j] == 0) {
        points.add(Point(i, j));
      }
    }
  }
  if (points.length > 0) {
    Point point = points[new Random().nextInt(points.length)];
    grid[point.x][point.y] = new Random().nextInt(10) > 3 ? 2 : 4;
    gridNew[point.x][point.y] = 1; // ?
  }
  return grid;
}
