import 'package:flutter/material.dart';

class TabItem {
  String title;
  Icon icon;
  TabItem(this.title, this.icon);

}

class TabItems {
  final List<TabItem> _tabBar = [
    TabItem('Photo', Icon(Icons.home)),
    TabItem('Chat', Icon(Icons.chat)),
    TabItem('Albums', Icon(Icons.album))
  ];

  returnListOfTabItems() {
    return _tabBar;
  }
}
