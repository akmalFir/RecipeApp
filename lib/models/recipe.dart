import 'package:hive/hive.dart';

part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  String name;

  @HiveField(1)
  String type;

  @HiveField(2)
  String image;

  @HiveField(3)
  List<String> ingredients;

  @HiveField(4)
  List<String> steps;

  Recipe({
    required this.name,
    required this.type,
    required this.image,
    required this.ingredients,
    required this.steps,
  });
}
