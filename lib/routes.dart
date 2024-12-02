import 'package:get/get.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/view/profile/profile_page.dart';
import 'view/authentication/auth_wrapper.dart';
import 'view/authentication/forgot_password_page.dart';
import 'view/authentication/login_page.dart';
import 'view/authentication/register.dart';
import 'view/home.dart';
import 'view/recipe/recipe_add.dart';
import 'view/recipe/recipe_detail.dart';
import 'view/recipe/recipe_home.dart';

class AppRoutes {
  static const home = '/home';
  static const root = '/';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';
  static const recipeHome = '/recipe-home';
  static const recipeAdd = '/recipe-add';
  static const recipeDetail = '/recipe-detail';
  static const profile = '/profile';

  final List<GetPage> getPages = [
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.root, page: () => AuthWrapper()),
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(name: AppRoutes.register, page: () => RegisterPage()),
    GetPage(name: AppRoutes.forgotPassword, page: () => ForgotPasswordPage()),
    GetPage(name: AppRoutes.recipeHome, page: () => const RecipeHome()),
    GetPage(
      name: AppRoutes.recipeAdd,
      page: () {
        final args = Get.arguments as Map<String, dynamic>?;
        final recipe = args?['recipe'] as Recipe?;
        final index = args?['index'] as int?;
        return RecipeAdd(recipe: recipe, index: index);
      },
    ),
    GetPage(
      name: AppRoutes.recipeDetail,
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        final recipe = args['recipe'] as Recipe;
        final index = args['index'] as int;
        return RecipeDetail(recipe: recipe, index: index);
      },
    ),
    GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
  ];
}
