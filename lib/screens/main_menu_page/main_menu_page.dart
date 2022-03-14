import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';
import 'package:ndc_medic_record_app/screens/drawer_page/app_drawer.dart';
import 'package:ndc_medic_record_app/screens/drawer_page/end_drawer.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/bottom_navigation.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ndc_medic_record_app/screens/main_menu_page/daily_medication/screens/task_screen.dart';
import '../login_registration_page/login_components/calculator_brain.dart';

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
  late TabController _tabController1;
  int _currentTabIndex = 0;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TabItems bottom_nav_bar = TabItems();

  Gender? selectedGender;
  int height = 180;
  int age = 18;
  int weight = 65;


  var listData = List.generate(
    50,
        (index) => Column(
      children: [
        Container(
          height: 65,
          child: ListTile(
            title: Text(index.toString()),
            trailing: Text('4\$'),
          ),
        ),
        Divider(
          height: 1,
          color: Colors.black45,
        ),
      ],
    ),
  );


  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: bottom_nav_bar.returnListOfTabItems().length, vsync: this);
    _tabController1 = TabController(
        length: 3, vsync: this);
  }

  Widget build(BuildContext context) {

    Color tabBarBGColor = Colors.white;

    if(_currentTabIndex == 0) {
      tabBarBGColor = Colors.grey.shade200;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: kStaticMainColor,
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
      endDrawer: EndDrawer(
        bmiResult:
            CalculatorBrain(height: height, weight: weight).calculateBMI(),
        bmiResultText:
            CalculatorBrain(height: height, weight: weight).getResult(),
        interpretation: CalculatorBrain(height: height, weight: weight)
            .getResultInterpretation(),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          Column(
            children: [
              Text('Our Doctor\'s'),
              Expanded(
                flex: 2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 300,
                      height: 200,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kStaticMainColorOpacity,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      //color: kStaticMainColorOpacity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/male.png',
                                scale: 1.4,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                ],
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Doctor Name'),
                              Text('Doctor information'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 200,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kStaticMainColorOpacity,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/male.png',
                                scale: 1.4,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                ],
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Doctor Name'),
                              Text('Doctor information'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 200,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kStaticMainColorOpacity,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/male.png',
                                scale: 1.4,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                  Icon(Icons.star_border),
                                ],
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Doctor Name'),
                              Text('Doctor information'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: TabBarView(controller: _tabController1,children: [
                Container(
                      height: double.infinity,
                      width: MediaQuery.of(context).size.width - 20,
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                  child: TaskScreen(),
                    ),
                  Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width - 20,
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Column(
                      children: [
                        Text('Analysis List',style: TextStyle(
                          fontSize: 30,
                          backgroundColor: Colors.grey.shade200
                        ),),
                        Expanded(
                          child: CustomScrollView(
                            shrinkWrap: true,
                            slivers: [
                              CupertinoSliverNavigationBar(
                                largeTitle: Text('Lab'),
                                backgroundColor: Colors.transparent,
                              ),
                              SliverList(delegate: SliverChildListDelegate(
                                [
                                  for (var item in listData) item,
                                ]
                              ),),
                              CupertinoSliverNavigationBar(
                                largeTitle: Text('USI'),
                                backgroundColor: Colors.transparent,
                              ),
                              SliverList(delegate: SliverChildListDelegate(
                                  [
                                    for (var item in listData) item,
                                  ]
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width - 20,
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            Text('About clinic',textAlign: TextAlign.center,),
                            Text('History',textAlign: TextAlign.left,),
                            Container(
                              width: 350,
                              height: 150,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: kStaticMainColorOpacity,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.'),
                              ),
                            ),
                            Text('Contacts',textAlign: TextAlign.left,),
                            Container(
                              width: 350,
                              height: 150,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: kStaticMainColorOpacity,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.'),
                              ),
                            ),
                            Text('Location',textAlign: TextAlign.left,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
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
        backgroundColor: tabBarBGColor,
        buttonBackgroundColor: kStaticMainColor,
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

