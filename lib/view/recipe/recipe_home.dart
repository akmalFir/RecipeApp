import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import '../../routes.dart';
import 'package:recipe_app/models/recipe.dart';

import '../../utils/recipe_types.dart';

class RecipeHome extends StatefulWidget {
  const RecipeHome({super.key});

  @override
  State<RecipeHome> createState() => _RecipeHomeState();
}

class _RecipeHomeState extends State<RecipeHome> {
  final RecipeController recipeController = Get.put(RecipeController());
  String selectedType = 'All';
  List<Recipe> filteredRecipes = [];
  List<Map<String, String>> recipeTypes = [];

  @override
  void initState() {
    super.initState();
    _loadTypes();
    filteredRecipes = recipeController.recipeList;
  }

  void filterRecipes() {
    setState(() {
      if (selectedType == 'All') {
        filteredRecipes = recipeController.recipeList;
      } else {
        filteredRecipes = recipeController.recipeList
            .where((recipe) => recipe.type == selectedType)
            .toList();
      }
    });
  }

  Future<void> _loadTypes() async {
    final types = await loadRecipeTypes();
    setState(() {
      recipeTypes = types;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            floating: true,
            snap: true,
            backgroundColor: context.theme.colorScheme.surfaceBright,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Recipe App'),
            ),
            actions: [
              PopupMenuButton<String>(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                tooltip: 'Filter recipes',
                onSelected: (String value) {
                  setState(() {
                    selectedType = value;
                    filterRecipes();
                  });
                },
                icon: const Icon(Icons.filter_list),
                iconSize: 28,
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      value: 'All',
                      child: Text('All'),
                    ),
                    ...recipeTypes.map((type) {
                      return PopupMenuItem(
                        value: type['types'],
                        child: Text(type['types']!),
                      );
                    }),
                  ];
                },
              ),
            ],
          ),
          Obx(
            () => filteredRecipes.isEmpty
                ? const SliverFillRemaining(
                    child: Center(
                      child: Text('No recipes found'),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final recipe = filteredRecipes[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          child: recipeCard(recipe, index),
                        );
                      },
                      childCount: filteredRecipes.length,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget recipeCard(Recipe recipe, int index) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.recipeDetail,
          arguments: {
            'recipe': recipe,
            'index': index,
          },
        );
      },
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: recipe.image.contains('assets')
                      ? AssetImage(recipe.image)
                      : FileImage(File(recipe.image)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    recipe.type,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
