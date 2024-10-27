import 'package:get/get.dart';

import '../../model/statstic_game_live_model/analyse_game_live_model.dart';
import '../../model/statstic_game_live_model/statstic_game_live_model.dart';
import '../../utils/service/statistic_game_live_service/analusis_game_live_service.dart';
import '../../utils/service/statistic_game_live_service/statstic_game_live_service.dart';

class AnalysisController extends GetxController {
  AnalysisController();

  Rx<AnalysisGameLiveModel> analysis = AnalysisGameLiveModel().obs;
  var isLoading = false.obs;

  final RxString errorMessage = RxString('');
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> sendAnalysis(
      AnalysisGameLiveModel statisticData, String url) async {
    print("yes");
    isLoading(true);

    try {
      var response =
          await AnalysisGameLiveService().fetchstatistic(url, statisticData);
      
      if (response != null) {
        analysis.value = response;
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading(false);
    }
  }
}
