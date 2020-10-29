import '../index.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners(); // 通知依赖的Widget更新
  }
}

class UserModel extends ProfileChangeNotifier {
  User get user => _profile.user;
  bool get isLogin => user != null;

  // 若用户信息变更， 通知刷新
  set user(User user) {
    if (user.login != _profile.user?.login) {
      _profile.lastLogin = _profile.user?.login;
      _profile.user = user;
      notifyListeners();
    }
  }
}

class ThemeModel extends ProfileChangeNotifier {
  ColorSwatch get theme =>
      Global.themes.firstWhere((element) => element.value == _profile.theme,
          orElse: () => Colors.blue);
  set theme(ColorSwatch color) {
    if (color != theme) {
      _profile.theme = color[500].value;
    }
  }
}
