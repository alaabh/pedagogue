abstract class BaseModel<T> {
  int? id;
  String mainAttribute = '';

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is T &&
          runtimeType == other.runtimeType &&
          id == (other as BaseModel).id;

  @override
  int get hashCode => id.hashCode;
}
