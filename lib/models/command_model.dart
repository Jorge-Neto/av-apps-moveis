import 'dart:convert';

class Itens {
  final int itemCode;
  final int itemProduct;
  final double itemQuantity;
  final double itemValue;
  final String itemName;
  final String itemObs;

  Itens({
    required this.itemCode,
    required this.itemProduct,
    required this.itemQuantity,
    required this.itemValue,
    required this.itemName,
    required this.itemObs,
  });

  Map<String, dynamic> toMap() {
    return {
      'itemCode': itemCode,
      'itemProduct': itemProduct,
      'itemQuantity': itemQuantity,
      'itemValue': itemValue,
      'itemName': itemName,
      'itemObs': itemObs,
    };
  }

  factory Itens.fromMap(Map<String, dynamic> map) {
    return Itens(
      itemCode: map['itemCode']?.toInt() ?? 0,
      itemProduct: map['itemProduct']?.toInt() ?? 0,
      itemQuantity: map['itemQuantity']?.toDouble() ?? 0.0,
      itemValue: map['itemValue']?.toDouble() ?? 0.0,
      itemName: map['itemName'] ?? '',
      itemObs: map['itemObs'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Itens.fromJson(String source) => Itens.fromMap(json.decode(source));
}

class CommandModel {
  final String objectId;
  final int comCode;
  final int comTable;
  final double comValue;
  List<Itens>? itens;

  CommandModel(
      {required this.objectId,
      required this.comCode,
      required this.comTable,
      required this.comValue,
      required this.itens});

  Map<String, dynamic> toMap() {
    return {
      'objectId': objectId,
      'comCode': comCode,
      'comTable': comTable,
      'comValue': comValue,
      'itens': itens?.map((x) => x.toMap()).toList(),
    };
  }

  factory CommandModel.fromMap(Map<String, dynamic> map) {
    return CommandModel(
      objectId: map['objectId'] ?? '',
      comCode: map['comCode']?.toInt() ?? 0,
      comTable: map['comTable']?.toInt() ?? 0,
      comValue: map['comValue']?.toDouble() ?? 0.0,
      itens: map['itens'] != null
          ? List<Itens>.from(map['itens']?.map((x) => Itens.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommandModel.fromJson(String source) =>
      CommandModel.fromMap(json.decode(source));

  double get total => itens!
      .map((e) => e.itemValue)
      .reduce((value, element) => value + element);
}
