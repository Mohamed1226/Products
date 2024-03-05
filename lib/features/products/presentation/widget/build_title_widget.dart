import 'package:flutter/material.dart';
import 'package:ready_structure/core/app_localization/app_localization.dart';

class BuildTitleWidget extends StatelessWidget {
  const BuildTitleWidget({required this.title, super.key});

  final String title;

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
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
