import 'package:flutter/material.dart';
import '../../constraints.dart';

class DoctorTabView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
