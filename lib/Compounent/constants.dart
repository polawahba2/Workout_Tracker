import 'package:flutter/material.dart';

// const Color kMainColor = Color.fromRGBO(31, 31, 40, 1);
const Color kMainColor = Color.fromARGB(232, 255, 255, 255);
const Color kPrimaryColor = Color.fromARGB(255, 75, 161, 231);
const Color kButtonOnColor = Color.fromARGB(255, 102, 255, 64);

const Color kWhite = Colors.white;
const Color kBlack = Colors.black;
const Color kBlue = Color.fromARGB(255, 0, 105, 190);

void pushOnly({required Widget route, required context}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void pushReplacement({required Widget route, required context}) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}
