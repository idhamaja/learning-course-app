import 'package:flutter/material.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    Center(child: Text("Home Page")),
    Center(child: Text("Search Page")),
    Center(child: Text("Course Page")),
    Center(child: Text("Chat Page")),
    Center(child: Text("Profile Page")),
  ];

  return _widget[index];
}
