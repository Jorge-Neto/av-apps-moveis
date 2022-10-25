import 'package:avaliacao/core/app_colors.dart';
import 'package:avaliacao/core/app_text.dart';
import 'package:flutter/material.dart';

enum TableStatus {free, occupied, closing}

Color statusToColor(TableStatus value) {
  Color color = AppColors.tableFreeStatus;

  switch (value) {
    case TableStatus.free:
      break;
    case TableStatus.occupied:
      color = AppColors.tableOccupiedStatus;
      break;
    case TableStatus.closing:
      color = AppColors.tableCloseStatus;
      break;
  }
  return color;
}

String statusToString(TableStatus value) {
  String name = 'Livre';
  switch (value) {
    case TableStatus.free:
      break;
    case TableStatus.occupied:
      name = "Ocupado";
      break;
    case TableStatus.closing:
      name = "Fechamento";
      break;
  }
  return name;
}

TableStatus stringToStatus(String value) {
  TableStatus status = TableStatus.free;
  switch (value) {
    case 'A':
      break;
    case "O":
      status = TableStatus.occupied;
      break;
    case "F":
      status = TableStatus.closing;
      break;
  }
  return status;
}

class ItemWidget extends StatelessWidget {
  final TableStatus status;
  final int index;
  final double totalValue;
  const ItemWidget({Key? key, required this.status, required this.index, required this.totalValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(status == TableStatus.free) {
          Navigator.of(context).pushNamed('/categories', arguments: index);
        } else {
          Navigator.of(context).pushNamed('/consumption', arguments: index);

        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: statusToColor(status),
            boxShadow: const [
          BoxShadow(
              offset: Offset(1, 1), color: Colors.black87, blurRadius: 2.0)
        ]),
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              statusToString(status),
              style: AppTextStyles.tableStatus,
            ),
            Text(
              index.toString().padLeft(2, '0'),
              style: AppTextStyles.tableIndex,
            ),
            Text(
              totalValue.toStringAsFixed(2),
              style: AppTextStyles.tableValue,
            )
          ],
        ),
      ),
    );
  }
}
