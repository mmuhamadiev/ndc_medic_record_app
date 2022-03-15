import 'package:flutter/material.dart';

import '../../constraints.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kStaticMainColor,
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20,top: 10,bottom: 10),
        child: Text('$name',style: TextStyle(color: Colors.white,fontSize: 25),),
      ),
    );
  }
}