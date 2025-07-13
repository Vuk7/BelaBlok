abstract class BaseModel {
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const BaseModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
}
