import 'index.dart';

class Huayingjuhe extends StatelessWidget {
  const Huayingjuhe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: ThemeModel()),
      ],
      child: Consumer<ThemeModel>(
        builder: (BuildContext context, themeModel, Widget child) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: themeModel.theme,
            ),
            title: '华影聚合',
            home: HomeRoute(),
            routes: <String, WidgetBuilder>{
              'login': (context) => LoginRoute(),
              'themes': (context) => ThemeChangeRoute(),
            },
          );
        },
      ),
    );
  }
}
