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