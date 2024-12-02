import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/models/recipe.dart';

import '../../routes.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe? recipe;
  final int? index;
  const RecipeDetail({
    super.key,
    this.recipe,
    this.index,
  });

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  final RecipeController recipeController = Get.find();
  final _nameController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _stepsController = TextEditingController();
  String? _imagePath;
  String? _recipeType;
  Future<void> _deleteRecipe() async {
    recipeController.deleteRecipe(widget.index!);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Recipe deleted successfully!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.recipe!.name;
    _ingredientsController.text = widget.recipe!.ingredients.join('\n');
    _stepsController.text = widget.recipe!.steps.join('\n');
    _imagePath = widget.recipe!.image;
    _recipeType = widget.recipe!.type;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.paddingOf(context).top,
              ),
              Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  if (_imagePath != null && _imagePath!.isNotEmpty)
                    _imagePath!.contains('assets')
                        ? Container(
                            height: MediaQuery.of(context).size.height * 1 / 3,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(_imagePath!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Image.file(
                            File(_imagePath!),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 1 / 3,
                            fit: BoxFit.cover,
                          )
                  else
                    const Center(
                      child: Text('No image found'),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: IconButton(
                            onPressed: _deleteRecipe,
                            icon: const Icon(Icons.delete_outlined),
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Text(
                        _recipeType ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _nameController.text,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _ingredientsController.text,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Steps',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _stepsController.text,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            Get.toNamed(
                              AppRoutes.recipeAdd,
                              arguments: {
                                'recipe': widget.recipe,
                                'index': widget.index,
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
