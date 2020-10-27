import 'package:flutter/material.dart';

class ScaffoldDemo extends StatefulWidget {
  ScaffoldDemo({Key key, this.title}) : super(key: key);
  final String title;
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

// enum WF {
//   harder,
//   smarter,
//   selfStarter,
//   tradingCharter,
// }

class _ScaffoldRouteState extends State<ScaffoldDemo>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;

  TabController _tabController;
  List tabs = ['新闻', '历史', '图片'];

  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
        // actions: [
        //   PopupMenuButton(
        //     onSelected: (value) {},
        //     icon: Icon(Icons.more_vert),
        //     itemBuilder: (context) => <PopupMenuEntry<WF>>[
        //       const PopupMenuItem<WF>(
        //         value: WF.harder,
        //         child: Text('Working a lot harder'),
        //       ),
        //       const PopupMenuItem<WF>(
        //         value: WF.smarter,
        //         child: Text('Being a lot smarter'),
        //       ),
        //       const PopupMenuItem<WF>(
        //         value: WF.selfStarter,
        //         child: Text('Being a self-starter'),
        //       ),
        //       const PopupMenuItem<WF>(
        //         value: WF.tradingCharter,
        //         child: Text('Placed in charge of trading charter'),
        //       ),
        //     ],
        //   )
        // ],
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 38.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/18389869.png',
                            width: 80,
                          ),
                        ),
                      ),
                      Text(
                        'Lee',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              Expanded(
                  child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage account'),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
