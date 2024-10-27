import 'package:get/get.dart';

import '../model/imc_child_model.dart';
import '../utils/service/imc_child_service.dart';


class ImcChildController extends GetxController {
  var isLoading = false.obs;
  Rx<ImcChild> imc = ImcChild().obs;
  

  @override
  void onInit() {
    super.onInit();
  }

  void fetchImcChild(String poids, String taille, String age) async {
    isLoading(true); // Start loading
    try {
      var imcChild = await ImcChildService().fetchImcChild(poids,taille,age);
      
      if (imcChild != null) {
        imc.value = imcChild;
      }
    } catch (e) {
      // Handle error, e.g., show an error message
      print("Error fetching data: $e");
    } finally {
      isLoading(false); // Stop loading, regardless of the outcome
    }
  }
}
