import 'package:meta/meta.dart';

class Unit{
  final String name;
  final double conversion;
  /// An example would be 'Meter' and '1.0'.
  Unit({required this.name, required this.conversion});

  /// Creates a [Unit] from a JSON object.
  Unit.fromJson(Map jsonMap) :
      assert(jsonMap['name'] != null),
      assert(jsonMap['conversion'] != null),
      name = jsonMap['name'],
      conversion = jsonMap['conversion'].toDouble();

}