/* 


import '../../model/statstic_game_live_model/team_management_model.dart';
import '../../utils/base_controller.dart';

import '../../utils/service/base_service.dart';
import '../../utils/service/statistic_game_live_service/team_management_service.dart';

class TeamMAnagementController extends BaseController<TeamManagementModel> {
  @override
  BaseService<TeamManagementModel>? get service => TeamManagementService.instance;
}

 */

import 'package:get/get.dart';
import 'package:pedagogue/model/statstic_game_live_model/team_management_model.dart';
import 'package:pedagogue/utils/service/statistic_game_live_service/team_management_service.dart';

class TeamMAnagementController extends GetxController {
  TeamMAnagementController();

  Rx<TeamManagementModel> analysis = TeamManagementModel().obs;
  var isLoading = false.obs;

  final RxString errorMessage = RxString('');
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> sendAnalysis(
      TeamManagementModel teamManagementData, String url) async {
    print("yes");
    isLoading(true);

    try {
      var response =
          await TeamManagementService().fetchstatistic(url, teamManagementData);

      if (response != null) {
        analysis.value = response;
      }
    } catch (e) {
      print("Error fetching data: ${e}");
    } finally {
      isLoading(false);
    }
  }
}
