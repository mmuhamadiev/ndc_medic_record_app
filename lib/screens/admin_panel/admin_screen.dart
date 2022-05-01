import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/screens/chat_page/user_list_screen.dart';
import 'package:ndc_medic_record_app/screens/record_page/user_list_result_screen.dart';

import '../../constraints.dart';
import '../../utils/auth_helper.dart';

class AdminScreen extends StatefulWidget {
  static const routeName = '/adminScreen';

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
        animationDuration: Duration(milliseconds: 1000),
        length: 2,
        vsync: this);
    super.initState();
  }

  String appBarText() {
    if(_currentTabIndex == 0) {
      return 'Result Panel';
    }
    else if(_currentTabIndex == 1) {
      return 'Chat/Users list';
    }
    return 'Page';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kStaticMainColor,
        title: Text(appBarText(), style: TextStyle( fontFamily: 'Grotesque', fontSize: 25),),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () async {
            final user = await AuthHelper.logOut();
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          },
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          Container(
            color: Colors.white,
            child: UserListResultScreen(),
          ),
          Container(
            color: Colors.white,
            child: UserListScreen(),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: kStaticMainColor,
        backgroundColor: Colors.white,
        buttonBackgroundColor: kOrange,
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 1000),
        onTap: (index) {
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          });
        },
        index: _currentTabIndex,
        items: [
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
