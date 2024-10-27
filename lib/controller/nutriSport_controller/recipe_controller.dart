import 'package:get/get.dart';

import '../../model/nutriSport_model/recipe_model.dart';
import '../../utils/service/nutriSport_service/recipe_service.dart';

class RecipeController extends GetxController {
  var isLoading = false.obs;
  var recipesList = <Recipe>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchRecipes(String type) async {
    isLoading(true); // Start loading
    try {
      var recipes = await RecipeProvider().fetchRecipes(type);
      if (recipes != null) {
        recipesList.value = recipes;
      }
    } catch (e) {
      // Handle error, e.g., show an error message
      print("Error fetching data: $e");
    } finally {
      isLoading(false); // Stop loading, regardless of the outcome
    }
  }
  /* void fetchRecipes(String type) async {
    try {
      isLoading(true);
      var recipes = await RecipeProvider().fetchRecipes(type);
      recipesList.value = recipes;
    } finally {
      isLoading(false);
    }
  } */
}
