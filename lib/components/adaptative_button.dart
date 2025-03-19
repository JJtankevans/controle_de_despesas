import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const AdaptativeButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Theme.of(context).colorScheme.primary,
          onPressed: onPressed,
          child: Text(label, style: TextStyle(color: Colors.white)),
        )
        : ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: onPressed,
          child: Text(label),
        );
  }
}
