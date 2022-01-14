import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:flutter_svg/svg.dart';

import '../../../support/style/application_typography.dart';
import '../../../support/utils/constants.dart';

abstract class TransportationSuccessViewModelProtocol with ChangeNotifier {
  void dipTapViewPackages();
}

class TransportationSuccessView extends StatelessWidget {
  final TransportationSuccessViewModelProtocol viewModel;

  const TransportationSuccessView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context)!;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    SvgPicture.asset(Constants.sendIconPath),
                    const Spacer(),
                    Text(
                      l10n.tripCreated,
                      textAlign: TextAlign.center,
                      style: ApplicationTypography.titilliumWeb32RegularGray,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.checkingPackages,
                      textAlign: TextAlign.center,
                      style: ApplicationTypography.titilliumWeb14RegularGray,
                    ),
                    const SizedBox(height: 28),
                    Text(
                      l10n.veracityDeclaration,
                      textAlign: TextAlign.center,
                      style: ApplicationTypography.titilliumWeb12RegularGray54,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: viewModel.dipTapViewPackages,
                      child: Text(
                        l10n.viewPackages,
                        style: ApplicationTypography.titilliumWeb16BoldWhite,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
