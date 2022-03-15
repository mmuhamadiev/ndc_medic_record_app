import 'package:flutter/material.dart';

const kBottomTextStyle = TextStyle(fontSize: 30, color: Colors.white,);

const kStaticMainColor = Color(0xff00A651);
const kStaticMainColorOpacity = Color(0x8000a651);

const kInputDecoration = InputDecoration(
  filled: false,
  fillColor: kStaticMainColorOpacity,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kStaticMainColorOpacity),
    borderRadius: BorderRadius.all(Radius.circular(25),),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kStaticMainColorOpacity),
    borderRadius: BorderRadius.all(Radius.circular(25),),
  ),
  hoverColor: Colors.black,
  focusColor: Colors.black,
  border: OutlineInputBorder(
    borderSide: BorderSide(color: kStaticMainColorOpacity),
    borderRadius: BorderRadius.all(Radius.circular(25),
    ),
  ),
);

const kTextWhiteColor = Colors.white;

const kTextStyle = TextStyle(
    fontSize: 20, color: kTextWhiteColor, fontWeight: FontWeight.bold);

const kNumberTextStyle =
TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white);

const kResultTextStyle = TextStyle(fontSize: 50, color: kStaticMainColor);

const kResultSmallTextStyle = TextStyle(fontSize: 30,color: Colors.white);

const kResultLargeTextStyle = TextStyle(fontSize: 100,color: Colors.white);