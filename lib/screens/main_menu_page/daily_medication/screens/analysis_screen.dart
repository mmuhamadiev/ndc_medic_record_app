import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndc_medic_record_app/constraints.dart';

class AnalysisScreen extends StatelessWidget {
  static const routeName = '/analysis_screen';

  var listData = List.generate(
    10,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Analysis List',
        ),
        backgroundColor: kStaticMainColor,
      ),
      body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  CupertinoSliverNavigationBar(
                    transitionBetweenRoutes: false,
                    heroTag: 'lab',
                    automaticallyImplyLeading: false,
                    largeTitle: Text('Lab'),
                    backgroundColor: Colors.transparent,
                  ),
                  SliverList(delegate: SliverChildListDelegate(
                      [
                        for (var item in listData) item,
                      ]
                  ),),
                  CupertinoSliverNavigationBar(
                    transitionBetweenRoutes: false,
                    heroTag: 'uzi',
                    automaticallyImplyLeading: false,
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
    );
  }
}
