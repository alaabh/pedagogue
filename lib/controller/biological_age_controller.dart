import 'package:get/get.dart';

import '../model/biological_age_model.dart';
import '../utils/service/biological_age_service.dart';

class BiologicalAgeController extends GetxController {
  var isLoading = false.obs;
  Rx<BiologicalAge> biologicalAge = BiologicalAge().obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchBiologicalAge(
    dynamic sex,
    dynamic age,
    dynamic race,
    dynamic longevity,
    dynamic Education,
    dynamic sleep,
    dynamic cholesterol,
    dynamic bp,
    dynamic smoking,
    dynamic heredity,
    dynamic weight,
    dynamic stress,
    dynamic activity,
    dynamic medexam,
    dynamic heart,
    dynamic lung,
    dynamic time,
    dynamic protein,
    dynamic drugs,
    dynamic femalehealth,
    dynamic pill,
    dynamic breakfast,
    dynamic meals,
    dynamic veg,
    dynamic refined,
    dynamic alcohol,
    dynamic happiness,
    dynamic depression,
    dynamic anxiety,
    dynamic relax,
    dynamic love,
    dynamic job,
    dynamic social,
    dynamic driving,
    dynamic seatbelt,
    dynamic risk,
  ) async {
    isLoading(true); // Start loading
    try {
      var biologicalAges = await BiologicalAgeService().fetchBiologicalAge(
        sex,
        age,
        race,
        longevity,
        Education,
        sleep,
        cholesterol,
        bp,
        smoking,
        heredity,
        weight,
        stress,
        activity,
        medexam,
        heart,
        lung,
        time,
        protein,
        drugs,
        femalehealth,
        pill,
        breakfast,
        meals,
        veg,
        refined,
        alcohol,
        happiness,
        depression,
        anxiety,
        relax,
        love,
        job,
        social,
        driving,
        seatbelt,
        risk,
      );

      if (biologicalAges != null) {
        biologicalAge.value = biologicalAges;
      }
    } catch (e) {
      // Handle error, e.g., show an error message
      print("Error fetching data: $e");
    } finally {
      isLoading(false); // Stop loading, regardless of the outcome
    }
  }
}
