import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:ndc_medic_record_app/screens/chat_page/chat_screen.dart';
import 'package:ndc_medic_record_app/screens/chat_page/user_list_screen.dart';
import 'package:ndc_medic_record_app/screens/drawer_page/app_drawer.dart';
import 'package:ndc_medic_record_app/screens/drawer_page/end_drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/tab_view_first_page.dart';

import '../record_page/record_screen.dart';

enum Gender {
  male,
  female,
}

class MainMenuPage extends StatefulWidget {
  static const routeName = '/main_menu';

  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage>
    with TickerProviderStateMixin {

  late TabController _tabController;
  int _currentTabIndex = 0;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(animationDuration: Duration(milliseconds: 1000),
        length: 3, vsync: this);
  }
  String appBarText() {
    if(_currentTabIndex == 0) {
      return 'Main Page';
    }
    else if(_currentTabIndex == 1) {
      return 'Result Page';
    }
    if(_currentTabIndex == 2) {
      return 'Chat Page';
    }
    return 'Page';
  }

  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: scaffoldKey,
      appBar: AppBar(
        elevation: _currentTabIndex == 0? 2: 0,
        backgroundColor: kStaticMainColor,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.account_circle_rounded));
        }),
        title: Text(appBarText(), style: TextStyle(fontFamily: 'Grotesque', fontSize: 25),),
        actions: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: Icon(Icons.list));
          })
        ],
      ),
      drawer: AppDrawer(),
      endDrawer: EndDrawer(),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          FirstTabView(),
          Container(
            color: Colors.white,
            child: RecordScreen(receiver: 'mmuhamadiev@mail.ru', leading: false,),
          ),
          Container(
            color: Colors.white,
            child: ChatScreen(receiver: 'mmuhamadiev@mail.ru', leading: false,),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: kStaticMainColor,
        backgroundColor: Colors.white,
        buttonBackgroundColor: kOrange,
        animationCurve: Curves.easeIn,
        animationDuration: Duration(seconds: 1),
        onTap: (index) {
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          });
        },
        index: _currentTabIndex,
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.addchart,
            color: Colors.white,
          ),
          Icon(
            Icons.chat,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

