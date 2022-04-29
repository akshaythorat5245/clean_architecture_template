import 'package:flutter/material.dart';

const textStyle = TextStyle(
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    color: Colors.black);
const textStyleWhite =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white);
const textStyleAdd = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    backgroundColor: Colors.white);
const textStyleCreate =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white);

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.white,
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final ButtonStyle createButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.blue,
  primary: Colors.blue,
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);
