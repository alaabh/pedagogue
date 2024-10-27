
import 'package:get/get.dart';
import 'package:pedagogue/model/nutriSport_model/calories_model.dart';
import 'package:pedagogue/utils/service/nutriSport_service/calories_service.dart';

class CaloriesController extends GetxController {
  var isLoading = false.obs;
  Rx<CaloriesModel> calorie = CaloriesModel().obs;
  var caloriesList = <CaloriesModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchCalories(String type) async {
    isLoading(true); // Start loading
    try {
      var calories = await CaloriesService().fetchRecipes(type);
      
      if (calories != null) {
        calorie.value = calories;
      }
    } catch (e) {
      // Handle error, e.g., show an error message
      print("Error fetching data: $e");
    } finally {
      isLoading(false); // Stop loading, regardless of the outcome
    }
  }
}
