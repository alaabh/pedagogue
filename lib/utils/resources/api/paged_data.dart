class PagedData<Model> {
  List<Model> itemList;
  late int page;
  late int size;
  late int totalElements;
  late int totalPages;
  late bool last;

  PagedData({
    required this.itemList,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.last,
  });

  PagedData.empty({
    this.itemList = const [],
    this.page = 0,
    this.size = 0,
    this.totalElements = 0,
    this.totalPages = 0,
    this.last = true,
  });

  factory PagedData.fromJson(
    Map<String, dynamic> json,
    Function modelFromJson,
  ) {
    return PagedData(
      itemList: List<Model>.from(
        json['content'].map((model) => modelFromJson(model)),
      ),
      page: json['page'] ?? 0,
      size: json['size'] ?? 0,
      totalElements: json['totalElements'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      last: json['last'] ?? true,
    );
  }

  String getInfo({required String title}) {
    if (totalPages != 0) {
      return 'Showing ${page + 1}/${totalPages + 1} pages of $totalElements $title';
    } else {
      return '';
    }
  }
}
