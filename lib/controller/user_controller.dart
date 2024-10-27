import 'package:get/get.dart';

import '../../../../utils/service/user_service.dart';
import '../model/user.dart';
import '../utils/resources/api/api_response.dart';

class UserController extends GetxController {
  var apiResponse = Rx<ApiResponse<User>>(ApiResponse.loading());

  User? get item => apiResponse.value.item;

  set item(User? user) => apiResponse.value.item = user;

  Future<ApiResponse> getByToken({bool withoutLoading = false}) async {
    if (!withoutLoading) apiResponse.value = ApiResponse.loading();
    apiResponse.value = await UserService.instance.getByToken();
    return apiResponse.value;
  }

  Future<ApiResponse> getAll() async {
    apiResponse.value = ApiResponse.loading();
    apiResponse.value = await UserService.instance.getAll();
    return apiResponse.value;
  }
}
