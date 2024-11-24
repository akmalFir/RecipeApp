import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/recipe.dart';

class RecipeController extends GetxController {
  var recipeList = <Recipe>[].obs;

  @override
  void onInit() {
    super.onInit();
    openBox();
  }

  void openBox() async {
    var box = await Hive.openBox<Recipe>('recipes');
    recipeList.addAll(box.values);
  }

  void clearBox() {
    Hive.box<Recipe>('recipes').clear();
    recipeList.clear();
  }

  void addRecipe(Recipe recipe) {
    recipeList.add(recipe);
    var box = Hive.box<Recipe>('recipes');
    box.add(recipe);
  }

  void updateRecipe(int index, Recipe newRecipe) {
    recipeList[index] = newRecipe;
    var box = Hive.box<Recipe>('recipes');
    box.putAt(index, newRecipe);
  }

  void deleteRecipe(int index) {
    recipeList.removeAt(index);
    var box = Hive.box<Recipe>('recipes');
    box.deleteAt(index);
  }
}
