import 'dart:convert';

class ProductModel {
  final String objectId;
  final int code;
  final String name;
  final double value;
  final String imageUrl;

  ProductModel(
      {required this.objectId, required this.code, required this.name, required this.value, required this.imageUrl,});

  Map<String, dynamic> toMap() {
    return {
      'objectId': objectId,
      'code': code,
      'name': name,
      'value': value,
      'imageUrl': imageUrl,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      objectId: map['objectId'] ?? '',
      name: map['name'] ?? '',
      code: map['code']?.toInt() ?? 0,
      value: map['value']?.toDouble() ?? 0.0,
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
