import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/view/authentication/login_page.dart';
import 'package:recipe_app/view/recipe/recipe_list.dart';

import '../../controller/authentication.dart';

class RootPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return authController.firebaseUser.value != null
          ? const RecipeList() 
          : LoginPage();
    });
  }
}
