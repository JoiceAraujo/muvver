import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../style/application_colors.dart';
import '../style/application_typography.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String assetPath;
  final void Function()? onPressed;

  const HomeCard({
    Key? key,
    this.onPressed,
    required this.title,
    required this.subTitle,
    required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ApplicationColors.darkGray,
              ApplicationColors.lightGray,
            ],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: ApplicationTypography.titilliumWeb20SemiBoldWhite,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subTitle,
                    style: ApplicationTypography.titilliumWeb14RegularWhite,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            SvgPicture.asset(assetPath),
          ],
        ),
      ),
    );
  }
}
