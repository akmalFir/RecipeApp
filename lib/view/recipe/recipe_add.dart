import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/models/recipe.dart';

import '../../utils/recipe_types.dart';

class RecipeAdd extends StatefulWidget {
  final Recipe? recipe;
  final int? index;
  const RecipeAdd({
    super.key,
    this.recipe,
    this.index,
  });

  @override
  State<RecipeAdd> createState() => _RecipeAddState();
}

class _RecipeAddState extends State<RecipeAdd> {
  final RecipeController recipeController = Get.find();
  final _formKey = GlobalKey<FormState>();
  String? _imagePath;
  final _nameController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _stepsController = TextEditingController();
  String? _recipeType;
  List<Map<String, String>> _recipeTypes = [];

  Future<void> saveRecipe() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final ingredients = _ingredientsController.text.trim().split('\n');
      final steps = _stepsController.text.trim().split('\n');

      final recipe = Recipe(
        name: name,
        type: _recipeType!,
        image: _imagePath ?? '',
        ingredients: ingredients,
        steps: steps,
      );

      recipeController.addRecipe(recipe);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Recipe saved successfully!')),
        );
        Navigator.pop(context);
      }
    }
  }

  Future<void> _updateRecipe() async {
    if (_nameController.text.trim().isEmpty ||
        _ingredientsController.text.trim().isEmpty ||
        _stepsController.text.trim().isEmpty ||
        _recipeType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields must be filled')),
      );
      return;
    }

    final updatedRecipe = Recipe(
      name: _nameController.text.trim(),
      type: _recipeType!,
      image: _imagePath ?? '',
      ingredients: _ingredientsController.text.trim().split('\n'),
      steps: _stepsController.text.trim().split('\n'),
    );

    recipeController.updateRecipe(widget.index!, updatedRecipe);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Recipe updated successfully!')),
      );

      Get.offAllNamed('/');
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  Future<void> _loadTypes() async {
    final types = await loadRecipeTypes();
    setState(() {
      _recipeTypes = types;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadTypes();
    if (widget.recipe != null) {
      _nameController.text = widget.recipe!.name;
      _ingredientsController.text = widget.recipe!.ingredients.join('\n');
      _stepsController.text = widget.recipe!.steps.join('\n');
      _imagePath = widget.recipe!.image;
      _recipeType = widget.recipe!.type;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.recipe != null
            ? const Text('Edit Recipe')
            : const Text('Add Recipe'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _recipeType,
                items: _recipeTypes
                    .map((type) => DropdownMenuItem<String>(
                          value: type['types'],
                          child: Text(type['types']!),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _recipeType = value),
                decoration: InputDecoration(
                  labelText: 'Recipe Type',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                validator: (value) =>
                    value == null ? 'Please select a recipe type' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Recipe Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                validator: (value) => value!.isEmpty ? 'Enter a name' : null,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _pickImage();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Pick an Image',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (_imagePath != null)
                Image.file(
                  File(_imagePath!),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1 / 3,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ingredientsController,
                decoration: InputDecoration(
                  labelText: 'Ingredients',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? 'Enter ingredients' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _stepsController,
                decoration: InputDecoration(
                  labelText: 'Steps',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                maxLines: 3,
                validator: (value) => value!.isEmpty ? 'Enter steps' : null,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    widget.recipe != null ? _updateRecipe() : saveRecipe();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Save Recipe',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
