import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({required this.label, this.value = 0.0, this.percentage = 0.0, super.key});

  final String label;
  final double value;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
