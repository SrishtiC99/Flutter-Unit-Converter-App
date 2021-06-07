
import 'dart:convert';

import 'package:flutter/material.dart';
import 'unit.dart';
import 'category.dart';
import 'unit_converter.dart';
import 'api.dart';

class CategoryRoute extends StatefulWidget {
  CategoryRoute();

  static const _colors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  final _categoryList = <Category>[];
  // Add image asset paths here
  static const _icons = <String>[
    'assets/icons/length.png',
    'assets/icons/area.png',
    'assets/icons/volume.png',
    'assets/icons/mass.png',
    'assets/icons/time.png',
    'assets/icons/digital_storage.png',
    'assets/icons/power.png',
    'assets/icons/currency.png',
  ];


  @override
    Future<void> didChangeDependencies() async {
     super.didChangeDependencies();
     // We have static unit conversions located in our
     // assets/data/regular_units.json
     if (_categoryList.isEmpty) {
       await _retrieveLocalCategories();
       await _retrieveApiCategory();
      }
    }

  /// Retrieves a list of [Categories] and their [Unit]s
  Future<void> _retrieveLocalCategories() async {
    final json = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/regular_units.json');
    final data = JsonDecoder().convert(await json);
    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }
    // Create Categories and their list of Units, from the JSON asset
    var categoryIndex = 0;
    data.keys.forEach((key) {
      final List<Unit> units =
      data[key].map<Unit>((dynamic data) => Unit.fromJson(data)).toList();

      var category = Category(key, CategoryRoute._colors[categoryIndex], _icons[categoryIndex],units);
      setState(() {
        _categoryList.add(category);
      });
      categoryIndex += 1;
    });
  }

  //  Add the Currency Category retrieved from the API, to our _categories
  /// Retrieves a [Category] and its [Unit]s from an API on the web
  Future<void> _retrieveApiCategory() async {
    // Add a placeholder while we fetch the Currency category using the API
    setState(() {
      _categoryList.add(Category( apiCategory['name']!, CategoryRoute._colors.last, _icons.last,[]));
    });
    final api = Api();
    final jsonUnits = await api.getUnits(apiCategory['route']!);
    // If the API errors out or we have no internet connection, this category
    // remains in placeholder mode (disabled)
    if (jsonUnits != null) {
      final units = <Unit>[];
      for (var unit in jsonUnits) {
        units.add(Unit.fromJson(unit));
      }
      setState(() {
        _categoryList.removeLast();
        _categoryList.add(Category(apiCategory['name']!, CategoryRoute._colors.last, _icons.last, units
        ));
      });
    }
  }

  _getCategoryWidget(Orientation deviceOrientation){
    if (deviceOrientation == Orientation.portrait) {
      return ListView.builder(
        itemCount: _categoryList.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
        return _categoryList[index];
        },
      );
    } else if (deviceOrientation == Orientation.landscape) {
      return GridView.builder(
          itemCount: _categoryList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return _categoryList[index];
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    var listView = Padding(
      padding: EdgeInsets.all(8),
      child: _getCategoryWidget(MediaQuery.of(context).orientation),
    );

    final appBar = AppBar(
      title: Text(
        "Unit Converter",
        style: TextStyle(fontSize: 30),
      ),
      elevation: 0.0,
      backgroundColor: Colors.blueGrey,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.green[100],
          appBar: appBar,
          body: listView
      ),
    );
  }
}
