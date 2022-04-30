import 'package:flutter/material.dart';

const kBottomTextStyle = TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'Grotesque',fontWeight: FontWeight.bold);

const kStaticMainColor = Color(0xff00A651);
const kStaticMainColorOpacity = Color(0xff75E6A4);
const kStaticOnboardingBgColor = Color(0xFFFFFFFF);

const colorizeColors = [
  kWhite,
  kWhite,
  kOrange,
  kStaticMainColor,
  kOrange,
  kWhite
];

const Color kWhite = Color(0xFFFFFFFF);
const Color kBlack = Color(0xFF000000);
const Color kOrange = Color(0xffFF6655);
const Color kDarkBlue = Color(0xff3F5B65);

const kInputDecoration = InputDecoration(
  filled: false,
  fillColor: kStaticMainColorOpacity,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kDarkBlue),
    borderRadius: BorderRadius.all(Radius.circular(25),),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kDarkBlue),
    borderRadius: BorderRadius.all(Radius.circular(25),),
  ),
  hoverColor: Colors.black,
  focusColor: Colors.black,
  border: OutlineInputBorder(
    borderSide: BorderSide(color: kDarkBlue),
    borderRadius: BorderRadius.all(Radius.circular(25),
    ),
  ),
);

const kTextWhiteColor = Colors.white;

const kTextStyle = TextStyle(
    fontSize: 20, color: kTextWhiteColor, fontWeight: FontWeight.bold, fontFamily: 'Grotesque');

const kNumberTextStyle =
TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white, fontFamily: 'Grotesque');

const kResultTextStyle = TextStyle(fontSize: 50, color: kStaticMainColor, fontFamily: 'Grotesque');

const kResultSmallTextStyle = TextStyle(fontSize: 30,color: Colors.white, fontFamily: 'Grotesque');

const kResultLargeTextStyle = TextStyle(fontSize: 100,color: Colors.white, fontFamily: 'Grotesque');

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
    fontFamily: 'Grotesque'
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);


const kInputDecoration2 = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);