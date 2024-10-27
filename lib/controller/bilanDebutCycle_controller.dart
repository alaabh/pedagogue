import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../model/bilanDebutCycleModel.dart';
import '../utils/resources/api/api_response.dart';
import '../utils/service/BilonDebutCycle_service.dart';

class BilanDebutCycleController {
  var apiResponse = Rx<ApiResponse<BilanDebutCycle>>(ApiResponse.loading());

  BilanDebutCycle? get item => apiResponse.value.item;

  Future<ApiResponse> getAll() async {
    apiResponse.value = ApiResponse.loading();
    apiResponse.value = await BilanDebutCycleService.instance.getAll();
    return apiResponse.value;
  }

  Future<ApiResponse> add(BilanDebutCycle bilanDebutCycle) async {
    apiResponse.value = ApiResponse.loading();
    apiResponse.value =
        await BilanDebutCycleService.instance.add(bilanDebutCycle);
    return apiResponse.value;
  }

  Future<ApiResponse> update(BilanDebutCycle bilanDebutCycle) async {
    apiResponse.value = ApiResponse.loading();
    apiResponse.value =
        await BilanDebutCycleService.instance.update(bilanDebutCycle);
    return apiResponse.value;
  }

  Future<ApiResponse> delete(int? bilanDebutCycleId) async {
    apiResponse.value = ApiResponse.loading();
    apiResponse.value =
        await BilanDebutCycleService.instance.delete(bilanDebutCycleId!);
    return apiResponse.value;
  }
}
