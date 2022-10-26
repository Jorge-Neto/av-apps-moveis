import 'dart:convert';

class CategoryModel {
  final String objectId;
  final int code;
  final String name;
  final String imageUrl;

  CategoryModel({required this.objectId, required this.code, required this.name, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'objectId': objectId,
      'code': code,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      objectId: map['objectId'] ?? '',
      code: map['code']?.toInt() ?? 0,
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));
}