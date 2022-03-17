import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../constraints.dart';

class AdminScreen extends StatefulWidget {
  static const routeName = '/adminScreen';

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> with TickerProviderStateMixin{

  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(animationDuration: Duration(milliseconds: 1000),
        length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          Container(
            color: Colors.white,
            child: Center(child: Text('1')),
          ),
          Container(
            color: Colors.white,
            child: Center(child: Text('1')),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: kStaticMainColor,
        backgroundColor: Colors.white,
        buttonBackgroundColor: kStaticMainColor,
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

