import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/firebase_options.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/routes.dart';

import 'controller/authentication_controller.dart';
import 'data/pre_populated_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());

  final recipeBox = await Hive.openBox<Recipe>('recipes');
  if (recipeBox.isEmpty) {
    recipeBox.addAll(getPrePopulatedRecipes());
  }
  // recipeBox.clear();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(AuthController());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top],
  );
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.root,
      getPages: AppRoutes().getPages,
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => Scaffold(
          body: Center(
            child: Text('No route defined for ${Get.parameters['route']}'),
          ),
        ),
      ),
    );
  }
}
