import '../../constants/env.dart';
import '../../model/user.dart';
import '../resources/api/api_response.dart';
import '../resources/api/api_service.dart';
import 'base_service.dart';

class UserService extends BaseService<User> {
  UserService._();

  static final UserService instance = UserService._();

  factory UserService() => instance;

  Future<ApiResponse<User>> login({
    required String email,
    required String password,
  }) async {
    return await makeApiCall(
      fromJsonFunction: User.fromJson,
      apiCall: ApiService.instance.sendRequest(
        body: {'email': email, 'password': password},
        url: '$baseUrl/login',
        httpMethod: HttpMethod.post,
        bodyItemName: 'user',
        willStoreToken: true,
      ),
    );
  }

  Future<ApiResponse<User>> getByToken() async {
    return await makeApiCall(
      fromJsonFunction: User.fromJson,
      apiCall: ApiService.instance.sendRequest(
        url: '$baseUrl/profile',
        httpMethod: HttpMethod.get,
      ),
    );
  }

  @override
  Future<ApiResponse<User>> getAll() async {
    return await makeApiCall(
      fromJsonFunction: User.fromJson,
      apiCall: ApiService.instance.sendRequest(
        url: '$baseUrl/users_active',
        httpMethod: HttpMethod.get,
      ),
    );
  }
}
