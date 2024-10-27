import 'package:get/get.dart';
import 'package:pedagogue/model/base_model.dart';
import 'package:pedagogue/utils/service/base_service.dart';
import '../../../../utils/resources/api/api_response.dart';

class BaseController<Model extends BaseModel> {
  var apiResponse = Rx<ApiResponse<Model>>(ApiResponse.loading());

  Model? get item => apiResponse.value.item;

  BaseService<Model>? get service => null;

  ApiResponse<Model> serviceUnassignedError() =>
      ApiResponse.error(message: "Service unassigned");

  Future<ApiResponse<Model>> getAll() async {
    if (service == null) return serviceUnassignedError();
    apiResponse.value = ApiResponse.loading();
    apiResponse.value = await service!.getAll();
    return apiResponse.value;
  }

  Future<ApiResponse<Model>> getById(int id) async {
    if (service == null) return serviceUnassignedError();
    apiResponse.value = ApiResponse.loading();
    apiResponse.value = await service!.getById(id);
    return apiResponse.value;
  }

  Future<ApiResponse<Model>> add(
    Model model, {
    List<String>? imagePathList,
    String? multipartParamName,
  }) async {
    if (service == null) return serviceUnassignedError();
    apiResponse.value = ApiResponse.loading();
    apiResponse.value = await service!.add(
      model,
      imagePathList: imagePathList,
      multipartParamName: multipartParamName,
    );
    return apiResponse.value;
  }

  Future<ApiResponse<Model>> update(
    Model model, {
    List<String>? imagePathList,
    String? multipartParamName,
  }) async {
    if (service == null) return serviceUnassignedError();
    apiResponse.value = ApiResponse.loading();
    apiResponse.value = await service!.update(
      model,
      imagePathList: imagePathList,
      multipartParamName: multipartParamName,
    );
    return apiResponse.value;
  }

  Future<ApiResponse<Model>> delete(int? id) async {
    if (service == null) return serviceUnassignedError();
    apiResponse.value = ApiResponse.loading();
    apiResponse.value = await service!.delete(id!);
    return apiResponse.value;
  }
}
