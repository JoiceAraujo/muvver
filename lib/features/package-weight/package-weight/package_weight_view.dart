import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../support/components/gradient_app_bar.dart';
import '../../../support/components/radio_list.dart';
import '../../../support/style/application_colors.dart';
import '../../../support/style/application_typography.dart';
import 'package_weight_view_model.dart';

abstract class PackageWeightViewModelProtocol with ChangeNotifier {
  PackageWeight? get packageWeight;

  void didTapCancel();
  void didTapSkipStep();
  void didTapGoForward();
  void updatePackageWeight(PackageWeight? value);
  String packageWeightIconByType(PackageWeight packageWeight);
  String packageWeightNameByType(PackageWeight packageWeight, Localization l10n);
}

class PackageWeightView extends StatelessWidget {
  final PackageWeightViewModelProtocol viewModel;

  const PackageWeightView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context)!;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GradientAppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: ApplicationColors.white,
              ),
            ),
            middle: Text(
              l10n.beMuvver,
              style: ApplicationTypography.titilliumWeb16RegularWhite,
            ),
            trailing: TextButton(
              onPressed: viewModel.didTapCancel,
              child: Text(
                l10n.cancel,
                style: ApplicationTypography.titilliumWeb14BoldWhite,
              ),
            ),
            helpText: Text(
              l10n.packageWeight,
              style: ApplicationTypography.titilliumWeb20RegularWhite,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              l10n.weight,
              style: ApplicationTypography.titilliumWeb16BoldGray,
            ),
          ),
          const SizedBox(height: 16),
          AnimatedBuilder(
            animation: viewModel,
            builder: (_, __) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: RadioList<PackageWeight>(
                          values: PackageWeight.values,
                          selectedValue: viewModel.packageWeight,
                          onChanged: viewModel.updatePackageWeight,
                          iconByType: viewModel.packageWeightIconByType,
                          nameByType: viewModel.packageWeightNameByType,
                        ),
                      ),
                      TextButton(
                        onPressed: viewModel.didTapSkipStep,
                        child: Text(
                          l10n.skipStep,
                          style: ApplicationTypography.titilliumWeb14BoldGray,
                        ),
                        style: TextButton.styleFrom(
                          fixedSize: const Size.fromHeight(48),
                        ),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: viewModel.packageWeight != null ? viewModel.didTapGoForward : null,
                        child: Text(
                          l10n.goForward,
                          style: ApplicationTypography.titilliumWeb16BoldWhite,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
