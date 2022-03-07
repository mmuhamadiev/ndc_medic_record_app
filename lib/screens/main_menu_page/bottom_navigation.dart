import 'package:flutter/material.dart';

class TabItem {
  String title;
  Icon icon;
  TabItem(this.title, this.icon);

}

class TabItems {
  final List<TabItem> _tabBar = [
    TabItem('Photo', Icon(Icons.home,color: Colors.white,)),
    TabItem('Record', Icon(Icons.addchart,color: Colors.white,)),
    TabItem('Chat', Icon(Icons.chat,color: Colors.white,))
  ];

  returnListOfTabItems() {
    return _tabBar;
  }
}
