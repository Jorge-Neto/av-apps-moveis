import 'dart:convert';

class CategoryModel {
  final String objectId;
  final int code;
  final String name;

  CategoryModel({required this.objectId, required this.code, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'objectId': objectId,
      'code': code,
      'name': name,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      objectId: map['objectId'] ?? '',
      code: map['code']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));
}