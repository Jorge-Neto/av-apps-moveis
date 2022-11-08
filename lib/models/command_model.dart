class CommandModel {
  final String objectId;
  final int comCode;
  final int comTable;
  final double comValue;
  final List? itens;

  CommandModel(
      {required this.objectId,
      required this.comCode,
      required this.comTable,
      required this.comValue,
      this.itens});

  double get total => itens!
      .map((e) => e.value)
      .reduce((value, element) => value + element);
}
