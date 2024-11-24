import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controller/recipe_controller.dart';

import '../../routes.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  final RecipeController recipeController = Get.put(RecipeController());
  final ishome = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Obx(
          () {
            return recipeController.recipeList.isEmpty
                ? const Center(child: Text('No recipes found'))
                : ListView.builder(
                    itemCount: recipeController.recipeList.length,
                    itemBuilder: (context, index) {
                      final recipe = recipeController.recipeList[index];
                      return Column(
                        children: [
                          recipeCard(recipe, index),
                          const SizedBox(height: 16),
                        ],
                      );
                    },
                  );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: context.mediaQuerySize.height * 0.08,
        color: context.theme.colorScheme.primary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                ishome ? null : Navigator.pushNamed(context, AppRoutes.home);
              },
              icon: const Icon(Icons.home, color: Colors.white),
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.recipeAdd);
                },
                icon: Icon(
                  Icons.add,
                  color: context.theme.colorScheme.primary,
                  weight: 20,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.profile);
              },
              icon: const Icon(Icons.people, color: Colors.white),
            ),
          ],
        ),
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
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: FileImage(File(recipe.image)),
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
