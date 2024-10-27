import 'package:get/get_rx/src/rx_types/rx_types.dart';


import '../model/bilan_fin_decycle_model.dart';
import '../utils/resources/api/api_response.dart';
import '../utils/service/bilan_fin_deCycle_service.dart';


class BilanFinCycleController {
  var apiResponse = Rx<ApiResponse<BilanFinCycle>>(ApiResponse.loading());

  BilanFinCycle? get item => apiResponse.value.item;

  Future<ApiResponse> getAll() async {
    apiResponse.value = ApiResponse.loading();
    apiResponse.value = await BilanFinCycleService.instance.getAll();
    return apiResponse.value;
  }

  Future<ApiResponse> add(BilanFinCycle bilanFinCycle) async {
    apiResponse.value = ApiResponse.loading();
    apiResponse.value =
        await BilanFinCycleService.instance.add(bilanFinCycle);
    return apiResponse.value;
  }

  Future<ApiResponse> update(BilanFinCycle bilanFinCycle) async {
    apiResponse.value = ApiResponse.loading();
    apiResponse.value =
        await BilanFinCycleService.instance.update(bilanFinCycle);
    return apiResponse.value;
  }

  Future<ApiResponse> delete(int? bilanFinCycleId) async {
    apiResponse.value = ApiResponse.loading();
    apiResponse.value =
        await BilanFinCycleService.instance.delete(bilanFinCycleId!);
    return apiResponse.value;
  }
}
