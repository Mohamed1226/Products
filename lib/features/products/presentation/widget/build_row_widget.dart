import 'package:flutter/material.dart';

class BuildRowWidget extends StatelessWidget {
  const BuildRowWidget({required this.title,required this.value, super.key});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
        ),
        Text(
          value,
        ),
      ],
    );
  }
}
