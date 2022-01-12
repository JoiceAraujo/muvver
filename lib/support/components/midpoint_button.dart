import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../style/application_typography.dart';
import '../utils/constants.dart';

class MidpointButton extends StatelessWidget {
  const MidpointButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context)!;

    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Constants.addCircleOutlineIconPath),
          const SizedBox(width: 8),
          Column(
            children: [
              Text(
                l10n.addMidpoint,
                textAlign: TextAlign.left,
                style: ApplicationTypography.titilliumWeb16BoldLightGray,
              ),
              Text(
                l10n.increaseMatchChance,
                textAlign: TextAlign.left,
                style: ApplicationTypography.titilliumWeb14RegularGray32,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
