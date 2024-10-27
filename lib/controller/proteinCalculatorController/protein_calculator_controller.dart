



import 'package:get/get.dart';
import 'package:pedagogue/utils/service/proteinCalculator_service/protein_calculator_service.dart';

import '../../model/proteinCalculator/protein_calculator_model.dart';

class ProteinCalculatorController extends GetxController {
  var isLoading = false.obs;
  Rx<ProteinCalculatorModel> protein = ProteinCalculatorModel().obs;
  

  @override
  void onInit() {
    super.onInit();
  }

  void fetchProteins( String sex,
    String heightSystem,
    String heightTens,
    String heightUnits,
    String age,
    String weightSystem,
    String goal,
    String activity,
    String weight,) async {
    isLoading(true); // Start loading
    try {
      var proteins = await ProteinCalculatorService().fetchprotein(
        sex,heightSystem,heightTens,heightUnits,age,weightSystem,goal,activity,weight
        );
      
      if (proteins != null) {
        protein.value = proteins;
      }
      
    } catch (e) {
      // Handle error, e.g., show an error message
      print("Error fetching data: $e");
    } finally {
      isLoading(false); // Stop loading, regardless of the outcome
    }
  }
}
