import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../support/components/gradient_app_bar.dart';
import '../../../support/components/radio_list.dart';
import '../../../support/style/application_colors.dart';
import '../../../support/style/application_typography.dart';
import 'package_size_view_model.dart';

abstract class PackageSizeViewModelProtocol with ChangeNotifier {
  PackageSize? get packageSize;

  void didTapCancel();
  void didTapSkipStep();
  void didTapGoForward();
  void updatePackageSize(PackageSize? value);
  String packageSizeIconByType(PackageSize packageSize);
  String packageSizeNameByType(PackageSize packageSize, Localization l10n);
  String packageSizeDescriptionByType(PackageSize packageSize, Localization l10n);
}

class PackageSizeView extends StatelessWidget {
  final PackageSizeViewModelProtocol viewModel;

  const PackageSizeView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context)!;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GradientAppBar(
            helpText: Text(
              l10n.packageSizeSimilarTo,
              style: ApplicationTypography.titilliumWeb20RegularWhite,
            ),
            middle: Text(
              l10n.beMuvver,
              style: ApplicationTypography.titilliumWeb16RegularWhite,
            ),
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: ApplicationColors.white,
              ),
            ),
            trailing: TextButton(
              onPressed: viewModel.didTapCancel,
              child: Text(
                l10n.cancel,
                style: ApplicationTypography.titilliumWeb14BoldWhite,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              l10n.sizes,
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
                        child: RadioList<PackageSize>(
                          values: PackageSize.values,
                          selectedValue: viewModel.packageSize,
                          onChanged: viewModel.updatePackageSize,
                          iconByType: viewModel.packageSizeIconByType,
                          nameByType: viewModel.packageSizeNameByType,
                          descriptionByType: viewModel.packageSizeDescriptionByType,
                        ),
                      ),
                      const SizedBox(height: 16),
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
                        onPressed: viewModel.packageSize != null ? viewModel.didTapGoForward : null,
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
