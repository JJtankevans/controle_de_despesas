import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final Function(String) onSubmit;
  final TextEditingController controller;
  final TextInputType type;

  const AdaptativeTextField({
    super.key,
    required this.label,
    required this.onSubmit,
    required this.controller,
    this.type = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: CupertinoTextField(
            placeholder: label,
            controller: controller,
            onSubmitted: onSubmit,
            keyboardType: type,
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            textInputAction: TextInputAction.done,
            onChanged: (value) {
              controller.text = value.replaceAll(',', '.');
              controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length),
              );
            },
          ),
        )
        : TextField(
          decoration: InputDecoration(labelText: label),
          controller: controller,
          onSubmitted: onSubmit,
          keyboardType: type,
        );
  }
}
