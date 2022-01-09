import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../support/components/avatar_image.dart';
import '../../../support/components/home_card.dart';
import '../../../support/style/application_typography.dart';
import '../../../support/utils/constants.dart';

abstract class HomeViewModelProtocol with ChangeNotifier {
  void didTapTraveler();
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context)!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(Constants.logoPath),
                const AvatarImage(assetPath: Constants.avatarPath),
              ],
            ),
            const SizedBox(height: 48),
            Text.rich(
              TextSpan(
                text: l10n.slogan01,
                style: ApplicationTypography.titilliumWeb20Regular,
                children: [
                  TextSpan(
                    text: l10n.slogan02,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.homeDescription,
              textAlign: TextAlign.center,
              style: ApplicationTypography.titilliumWeb16Regular,
            ),
            const SizedBox(height: 40),
            HomeCard(
              title: l10n.sender,
              subTitle: l10n.senderDescription,
              assetPath: Constants.boxIconPath,
            ),
            const SizedBox(height: 24),
            HomeCard(
              title: l10n.traveler,
              subTitle: l10n.travelerDescription,
              assetPath: Constants.deliveryTruckIconPath,
              onPressed: viewModel.didTapTraveler,
            ),
          ],
        ),
      ),
    );
  }
}
