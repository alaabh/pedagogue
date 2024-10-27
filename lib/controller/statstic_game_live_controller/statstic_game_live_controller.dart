import 'package:get/get.dart';

import '../../model/statstic_game_live_model/statstic_game_live_model.dart';
import '../../utils/service/statistic_game_live_service/statstic_game_live_service.dart';

class StatisticController extends GetxController {
  StatisticController();

  Rx<StatisticGameLiveModel> statistic = StatisticGameLiveModel().obs;
  var isLoading = false.obs;

  final RxString errorMessage = RxString('');
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> sendStatistic(
      StatisticGameLiveModel statisticData, String url) async {
    print("yes");
    isLoading(true);

    try {
      var response =
          await StatisticGameLiveService().fetchstatistic(url, statisticData);
      
      if (response != null) {
        statistic.value = response;
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading(false);
    }
  }
}
