import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:ndc_medic_record_app/screens/drawer_page/app_drawer.dart';
import 'package:ndc_medic_record_app/screens/drawer_page/end_drawer.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/bottom_navigation.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/result_end_drawer.dart';

import '../login_registration_page/login_components/calculator_brain.dart';
import '../login_registration_page/login_components/image_content.dart';
import '../login_registration_page/login_components/login_constraints.dart';
import '../login_registration_page/login_components/reusable_card.dart';
import '../login_registration_page/login_components/round_icon_button.dart';

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
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();


  TabItems bottom_nav_bar = TabItems();

  Gender? selectedGender;
  int height = 180;
  int age = 18;
  int weight = 65;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: bottom_nav_bar.returnListOfTabItems().length, vsync: this);
    //_tabController.addListener(() { });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.account_circle_rounded));
        }),
        title: Text('Appbar'),
        actions: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: Icon(Icons.list));
          })
        ],
      ),
      drawer: AppDrawer(),
      endDrawer: EndDrawer(bmiResult: CalculatorBrain(height: height, weight: weight).calculateBMI(), bmiResultText: CalculatorBrain(height: height, weight: weight).getResult(), interpretation: CalculatorBrain(height: height, weight: weight).getResultInterpretation(),),
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
            child: Center(child: Text('2')),
          ),
          Container(
            color: Colors.white,
            child: Center(child: Text('3')),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: kStaticMainColor,
        backgroundColor: Colors.white,
        buttonBackgroundColor: kStaticMainColor,
        onTap: (index) {
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          });
        },
        index: _currentTabIndex,
        items: [
          Icon(Icons.home,color: Colors.white,),
          Icon(Icons.addchart,color: Colors.white,),
          Icon(Icons.chat,color: Colors.white,)
        ],
      ),
    );
  }
}