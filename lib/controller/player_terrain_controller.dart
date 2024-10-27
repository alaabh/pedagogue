//PlayerTerrainService


import 'package:get/get.dart';

import '../model/player_terrain_model.dart';
import '../utils/service/player_terrain_service.dart';

class PlayerTerrainController extends GetxController {
  var isLoading = false.obs;
  Rx<PlayerTerrain> playerTerrain = PlayerTerrain().obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchPlayerTerrain(
   
  ) async {
    isLoading(true); // Start loading
    try {
      var playerTerrains = await PlayerTerrainService().fetchPlayerTerrain(
       
      );

      if (playerTerrains != null) {
        playerTerrain.value = playerTerrains;
      }
    } catch (e) {
      // Handle error, e.g., show an error message
      print("Error fetching data: $e");
    } finally {
      isLoading(false); // Stop loading, regardless of the outcome
    }
  }
}