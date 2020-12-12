import 'package:flutter_practice/practice_exampled/evolution/row_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

RowResult operate(
    List<int> row, int score, SharedPreferences sharedPreferences) {
  row = slide(row); // 右移
  RowResult result = combine(row, score, sharedPreferences); // 合并
  result.row = slide(result.row); // 合并后有新的空位，再右移
  return result;
}

/// 筛掉为零的，为了移动，零是一个空位。flutter没有filter？
List<int> filter(List<int> row) {
  List<int> temp = [];
  for (int i = 0; i < row.length; i++) {
    if (row[i] != 0) {
      temp.add(row[i]);
    }
  }
  return temp;
}

/// 移动后补零
List<int> slide(List<int> row) {
  List<int> arr = filter(row);
  List<int> zeroes = zeroArray(4 - arr.length);
  return zeroes + arr;
}

/// 需要几个零补几个零
List<int> zeroArray(int length) {
  List<int> zeroes = [];
  for (int i = 0; i < 4; i++) {
    zeroes.add(0);
  }
  return zeroes;
}

/// 合并
RowResult combine(
    List<int> row, int score, SharedPreferences sharedPreferences) {
  // 都转做水平向右滑动，所以右往左比较
  for (int i = 3; i >= 1; i--) {
    int right = row[i];
    int left = row[i - 1];
    if (right == left) {
      row[i] += right + left;
      row[i - 1] = 0;
      score += row[i];
      // 是否需要更新最高分
      int sc = sharedPreferences.getInt('high_score');
      if (sc == null || score > sc) {
        sharedPreferences.setInt('high_score', score);
      }
    }
  }
  return RowResult(score, row);
}

bool isGameWon(List<List<int>> grid) {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (grid[i][j] == 2048) {
        return true;
      }
    }
  }
  return false;
}

bool isGameOver(List<List<int>> grid) {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (grid[i][j] == 0) {
        return false;
      }
      // 当前tile和右边的tile相等，可合并
      if (i != 3 && grid[i][j] == grid[i + 1][j]) {
        return false;
      }
      if (j != 3 && grid[i][j] == grid[i][j + 1]) {
        return false;
      }
    }
  }
  return true;
}
