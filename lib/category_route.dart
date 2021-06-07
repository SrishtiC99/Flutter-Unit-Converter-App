
import 'package:flutter/material.dart';
import 'category.dart';
import 'unit_converter.dart';

class CategoryRoute extends StatefulWidget {
  CategoryRoute();

  static const _categoryNames = <String>[
    "Length",
    "Area",
    "Volume",
    "Mass",
    "Time",
    "Digital Storage",
    "Energy",
    "Currency"
  ];
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
  late List<Category> _categoryList = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < CategoryRoute._categoryNames.length; i++) {
      _categoryList.add(new Category(CategoryRoute._categoryNames[i],
          CategoryRoute._colors[i], Icons.cake));
    }
  }

  _getCategoryWidget(Orientation deviceOrientation){
    if (deviceOrientation == Orientation.portrait) {
      return ListView.builder(
        itemCount: CategoryRoute._colors.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
        return _categoryList[index];
        },
      );
    } else if (deviceOrientation == Orientation.landscape) {
      return GridView.builder(
          itemCount: CategoryRoute._colors.length,
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
      centerTitle: true,
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
