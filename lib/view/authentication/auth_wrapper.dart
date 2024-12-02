import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/view/authentication/login_page.dart';

import '../../controller/authentication_controller.dart';
import '../home.dart';

class AuthWrapper extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return authController.firebaseUser.value != null
          ? HomePage()
          : LoginPage();
    });
  }
}
