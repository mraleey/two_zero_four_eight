import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final Color? color;
  final String hintText;
  final String? dropDownValue;
  final List<DropdownMenuItem<String>> dropDownItems;
  final Function(String?)? onChanged;

  const CustomDropdownButton(
      {super.key,
      required this.dropDownValue,
      this.hintText = "Select",
      required this.dropDownItems,
      this.onChanged,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: DropdownButton<String>(
        menuMaxHeight: 250,
        padding: const EdgeInsets.only(right: 20, left: 20),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 30,
        borderRadius: BorderRadius.circular(20),
        hint: Text(hintText),
        underline: const SizedBox(),
        autofocus: true,
        itemHeight: 60,
        dropdownColor: Colors.white,
        value: dropDownValue,
        isExpanded: true,
        items: dropDownItems,
        onChanged: onChanged,
      ),
    );
  }
}
