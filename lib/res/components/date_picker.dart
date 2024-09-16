import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'app_colors.dart';
import 'textfield.dart';

class CustomDueDatePicker extends StatelessWidget {
  final TextEditingController dateController;
  final Rx<DateTime> controller;
  final String hintText;

  const CustomDueDatePicker({
    super.key,
    required this.dateController,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: kSecondaryColor,
                ),
              ),
              child: child!,
            );
          },
        );

        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy/MM/dd').format(pickedDate);
          dateController.text = formattedDate;
          controller.value = pickedDate;
        }
      },
      child: AbsorbPointer(
        child: CustomTextField(
          controller: dateController,
          labelText: hintText,
          prefixIcon: Icons.event,
          prefixIconColor: kSecondaryColor,
          labelColor: kSecondaryColor,
          borderColor: kSecondaryColor,
        ),
      ),
    );
  }
}
