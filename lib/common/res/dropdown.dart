import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({super.key, this.onSelected, this.selectedItem});
  final void Function(String?)? onSelected;
  final int? selectedItem;

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

List<String> list = List.generate(365, (index) => (index + 1).toString());

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String dropdownValue = list[0];

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      menuHeight: 300,
      initialSelection: (widget.selectedItem?.toString()) ?? list.first,
      onSelected: (String? value) {
        widget.onSelected!(value);
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
