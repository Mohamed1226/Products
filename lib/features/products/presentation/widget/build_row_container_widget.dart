import 'package:flutter/material.dart';
import 'package:ready_structure/core/theming/colors/colors_manager.dart';

class BuildRowContainerWidget extends StatelessWidget {
  const BuildRowContainerWidget({required this.title,required this.value, super.key});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
        color: AppFixedColors.secondaryColor1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            title,
          ),
          Text(
            value,
          )
        ],
      ),
    );
  }
}
