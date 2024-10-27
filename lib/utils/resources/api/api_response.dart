import 'package:pedagogue/utils/resources/api/paged_data.dart';

enum ApiStatus { completed, loading, error }

class ApiResponse<T> {
  ApiStatus status;
  int? statusCode;
  T? item;
  List<T> itemList = [];
  PagedData<T> pagedData = PagedData.empty();
  dynamic customData;
  String message;

  ApiResponse(this.status, this.item, this.itemList, this.message);

  ApiResponse.loading({
    this.status = ApiStatus.loading,
    this.message = 'Loading',
  });

  ApiResponse.completed({
    this.status = ApiStatus.completed,
    this.message = 'No message',
    this.item,
    this.itemList = const [],
  });

  ApiResponse.error({
    this.status = ApiStatus.error,
    this.message = 'No message',
    this.statusCode,
  });
}
