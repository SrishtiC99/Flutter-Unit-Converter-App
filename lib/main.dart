import 'package:flutter/material.dart';
import 'package:flutter_udacity1/category.dart';
import 'package:flutter_udacity1/category_route.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Unit Converter",
      home: CategoryRoute()
    );
  }
}
