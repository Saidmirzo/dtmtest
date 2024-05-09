import 'package:dtmtest/common/res/colors.gen.dart';
import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({
    super.key,
    required this.columnNames,
    required this.columnList,
    required this.onDelete,
    required this.onEdit,
  });
  final List<String> columnNames;
  final List<List<Widget>> columnList;
  final Function(int index) onDelete;
  final Function(int index) onEdit;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: List.generate(
        columnNames.length,
        (index) => DataColumn(label: Text(columnNames[index])),
      ),
      rows: List<DataRow>.generate(
        columnList.length,
        (index) => DataRow(
          cells: [
            ...List.generate(
              columnList[index].length,
              (i) => DataCell(
                columnList[index][i],
              ),
            ),
            DataCell(
              PopupMenuButton(
                iconColor: ColorName.blue,
                surfaceTintColor: ColorName.white,
                position: PopupMenuPosition.under,
                onSelected: (value) {
                  // your logic
                },
                itemBuilder: (BuildContext bc) {
                  return [
                    PopupMenuItem(
                      onTap: () {
                        onDelete(index);
                      },
                      value: '/Delete',
                      child: const Text("Delete"),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        onEdit(index);
                      },
                      value: '/Edit',
                      child: const Text("Edit"),
                    ),
                  ];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
