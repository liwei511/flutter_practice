// import 'package:flutter/material.dart';
import '../index.dart';

class LoginRoute extends StatefulWidget {
  LoginRoute({Key key}) : super(key: key);

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = false; // 是否显示密码
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  void initState() {
    _unameController.text = Global.profile.lastLogin;
    if (_unameController.text != null) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: _nameAutoFocus,
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  return value.trim().isNotEmpty ? null : '请填用户名';
                },
              ),
              TextFormField(
                autofocus: !_nameAutoFocus,
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '密码',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          pwdShow ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          pwdShow = !pwdShow;
                        });
                      },
                    )),
                obscureText: !pwdShow,
                validator: (value) {
                  return value.trim().isNotEmpty ? null : '请填密码';
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: RaisedButton(
                    child: Text('登录'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: _onLogin,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    // 验证表单是否合法
    if ((_formKey.currentState as FormState).validate()) {
      User user;
      try {
        // 假装登录了
        user = User.fromJson({'login': _unameController.text});
        print(user);
        Provider.of<UserModel>(context, listen: true).user = user;
      } catch (e) {
        // 登录失败
      } finally {
        // 关闭loading框
      }
      if (user != null) {
        // 返回首页
        Navigator.of(context).pop();
      }
    }
  }
}
