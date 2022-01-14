import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../support/utils/constants.dart';
import 'package_weight_view.dart';

abstract class PackageWeightProtocol extends PackageWeightViewModelProtocol {
  void Function()? onTapCancel;
  void Function()? onTapSkipStep;
  void Function()? onTapGoForward;
}

class PackageWeightViewModel extends PackageWeightProtocol {
  PackageWeight? _packageWeight;

  @override
  PackageWeight? get packageWeight => _packageWeight;

  @override
  void Function()? didTapCancel() {
    onTapCancel?.call();
  }

  @override
  void Function()? didTapSkipStep() {
    onTapSkipStep?.call();
  }

  @override
  void Function()? didTapGoForward() {
    onTapGoForward?.call();
  }

  @override
  void updatePackageWeight(PackageWeight? value) {
    _packageWeight = value;
    notifyListeners();
  }

  @override
  String packageWeightIconByType(PackageWeight packageWeight) {
    switch (packageWeight) {
      case PackageWeight.upToOneKilo:
        return Constants.balanceOneKiloIconPath;
      case PackageWeight.upToFiveKilos:
        return Constants.balanceFiveKilosIconPath;
      case PackageWeight.upToTenKilos:
        return Constants.balanceTenKilosIconPath;
      case PackageWeight.upToTwentyKilos:
        return Constants.balanceTwentyKilosIconPath;
      case PackageWeight.other:
        return Constants.balanceOthersIconPath;
    }
  }

  @override
  String packageWeightNameByType(PackageWeight packageWeight, Localization l10n) {
    switch (packageWeight) {
      case PackageWeight.upToOneKilo:
        return l10n.upToOneKilo;
      case PackageWeight.upToFiveKilos:
        return l10n.upToFiveKilos;
      case PackageWeight.upToTenKilos:
        return l10n.upToTenKilos;
      case PackageWeight.upToTwentyKilos:
        return l10n.upToTwentyKilos;
      case PackageWeight.other:
        return l10n.other;
    }
  }
}

enum PackageWeight {
  upToOneKilo,
  upToFiveKilos,
  upToTenKilos,
  upToTwentyKilos,
  other,
}
