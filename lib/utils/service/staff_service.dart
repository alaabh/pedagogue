import '../../constants/env.dart';
import '../../model/staff.dart';
import '../resources/api/api_response.dart';
import '../resources/api/api_service.dart';
import 'base_service.dart';

class StaffService extends BaseService<Staff> {
  StaffService._();

  static final StaffService instance = StaffService._();

  factory StaffService() => instance;

  @override
  String apiUrl = '$baseUrl/staff';

  @override
  Function? get fromJsonFunction => Staff.fromJson;

  @override
  Function(Staff staff)? get toJsonFunction => (Staff staff) => staff.toJson();

  Future<ApiResponse<Staff>> getByStaffType(StaffType staffType) async {
    return await makeApiCall(
      fromJsonFunction: fromJsonFunction,
      apiCall: ApiService.instance.sendRequest(
        url: '$apiUrl/${staffType.value}',
        httpMethod: HttpMethod.get,
      ),
    );
  }
}
