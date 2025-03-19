import 'dart:io';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  const AdaptativeDatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    return Platform.isIOS
        ? Container(
          height: !isLandscape ? 180 : 120,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            minimumDate: DateTime(2019),
            maximumDate: DateTime.now(),
            onDateTimeChanged: onDateChanged,
          ),
        )
        : Container(
          height: !isLandscape ? 70 : 40,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  selectedDate == null
                      ? "Nenhuma data selecionada!"
                      : "Data selecionada: ${DateFormat("dd/MM/y").format(selectedDate)}",
                ),
              ),
              TextButton(
                onPressed: () => _showDatePicker(context),
                child: Text(
                  "Selecionar data",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
  }
}
