import 'dart:convert';

class TableModel {
  final String objectId;
  final String tableName;
  final String tableState;
  final int tableJunction;
  final double tableValue;
  final int tableCode;

  TableModel({
    required this.objectId,
    required this.tableName,
    required this.tableState,
    required this.tableJunction,
    required this.tableValue,
    required this.tableCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'objectId': objectId,
      'tableName': tableName,
      'tableState': tableState,
      'tableJunction': tableJunction,
      'tableValue': tableValue,
      'tableCode': tableCode,
    };
  }

  factory TableModel.fromMap(Map<String, dynamic> map) {
    return TableModel(
      objectId: map['objectId'] ?? '',
      tableName: map['tableName'] ?? '',
      tableState: map['tableState'] ?? '',
      tableJunction: map['tableJunction']?.toInt() ?? 0,
      tableValue: map['tableValue']?.toDouble() ?? 0.0,
      tableCode: map['tableCode']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TableModel.fromJson(String source) =>
      TableModel.fromMap(json.decode(source));
}
