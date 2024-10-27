import 'package:pedagogue/model/staff.dart';
import 'package:pedagogue/utils/base_controller.dart';
import 'package:pedagogue/utils/resources/api/api_response.dart';
import '../utils/service/base_service.dart';
import '../utils/service/staff_service.dart';

class StaffController extends BaseController<Staff> {
  @override
  BaseService<Staff>? get service => StaffService.instance;

  Future<ApiResponse<Staff>> getByStaffType({
    required StaffType staffType,
  }) async {
    apiResponse.value = ApiResponse.loading();
    apiResponse.value = await StaffService.instance.getByStaffType(staffType);
    return apiResponse.value;
  }
}
