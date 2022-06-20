import 'package:flutter/material.dart';

class Item{
  Item({
    required this.headerItem,
    required this.discription,
    this.expanded = false, required MaterialColor colorsItem,
  });

  String headerItem;
  String discription;
  bool expanded;


  //get expanded => null;
}