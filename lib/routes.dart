import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/view/profile/profile_page.dart';
import 'view/authentication/auth_wrapper.dart';
import 'view/authentication/forgot_password_page.dart';
import 'view/authentication/login_page.dart';
import 'view/authentication/register.dart';
import 'view/recipe/recipe_add.dart';
import 'view/recipe/recipe_detail.dart';
import 'view/recipe/recipe_list.dart';

class AppRoutes {
  static const root = '/';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';
  static const home = '/home';
  static const recipeAdd = '/recipe-add';
  static const recipeDetail = '/recipe-detail';
  static const profile = '/profile';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return MaterialPageRoute(builder: (_) => RootPage());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case home:
        return MaterialPageRoute(builder: (_) => const RecipeList());
      case recipeAdd:
        final args = settings.arguments as Map<String, dynamic>?;
        final recipe = args?['recipe'] as Recipe?;
        final index = args?['index'] as int?;
        return MaterialPageRoute(
          builder: (_) => RecipeAdd(recipe: recipe, index: index),
        );
      case recipeDetail:
        final args = settings.arguments as Map<String, dynamic>;
        final recipe = args['recipe'] as Recipe;
        final index = args['index'] as int;
        return MaterialPageRoute(
          builder: (_) => RecipeDetail(recipe: recipe, index: index),
        );
      case profile:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
