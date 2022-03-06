import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/bottom_navigation.dart';

class MainMenuPage extends StatefulWidget {

  static const routeName = '/main_menu';

  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  TabItems bottom_nav_bar = TabItems();

  void CurrentPageTitle() {

  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: bottom_nav_bar.returnListOfTabItems().length, vsync: this);
    //_tabController.addListener(() { });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
        actions: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: Icon(Icons.account_circle_rounded));
          })
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    DrawerHeader(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 14.0),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.blue,
                        backgroundImage: NetworkImage(
                            'https://cdn1.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.jpg'),
                      ),
                    ),
                    Builder(builder: (context) {
                      return ListTile(
                          leading: Icon(Icons.home),
                          title: Text('Home'),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () => Navigator.of(context).pop()
                      );
                    }),
                    Builder(builder: (context) {
                      return ListTile(
                        leading: Icon(Icons.portrait_outlined),
                        title: Text('Profile'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () => Scaffold.of(context).openEndDrawer(),
                      );
                    }),
                    ListTile(
                      leading: Icon(Icons.image),
                      title: Text('Images'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DrawerHeader(
                      margin: EdgeInsets.only(bottom: 0),
                      padding: EdgeInsets.fromLTRB(20, 70, 20, 4),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue,
                        backgroundImage: NetworkImage(
                            'https://thumbs.dreamstime.com/b/happy-smiling-geek-hipster-beard-man-cool-avatar-geek-man-avatar-104871313.jpg'),
                      ),
                    ),
                    Center(
                      child: Text('Username'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: Center(child: Text('1')),
          ),
          Container(
            child: Center(child: Text('2')),
          ),
          Container(
            child: Center(child: Text('3')),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          });
        },
        currentIndex: _currentTabIndex,
        items: [
          for (final item in bottom_nav_bar.returnListOfTabItems())
            BottomNavigationBarItem(label: item.title, icon: item.icon),
        ],
      ),
    );
  }
}