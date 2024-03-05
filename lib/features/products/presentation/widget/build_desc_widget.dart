import 'package:flutter/material.dart';
import 'package:ready_structure/core/app_localization/app_localization.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';

class BuildDescWidget extends StatelessWidget {
  const BuildDescWidget({required this.description, super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
      AppLocalize.isArabic ? Alignment.centerRight : Alignment.centerLeft,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            description,
            maxLines: 5,
            style: Styles.font12PrimaryColorWeight700(),
          ),
        ),
      ),
    );
  }
}
