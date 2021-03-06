import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../models/transportation.dart';
import '../../../support/utils/constants.dart';
import 'package_size_view.dart';

abstract class PackageSizeProtocol extends PackageSizeViewModelProtocol {
  Transportation get transportation;

  void Function()? onTapCancel;
  void Function()? onTapSkipStep;
  void Function()? onTapGoForward;
}

class PackageSizeViewModel extends PackageSizeProtocol {
  final Transportation _transportation;

  @override
  Transportation get transportation => _transportation;

  @override
  PackageSize? get packageSize => _transportation.packageSize;

  PackageSizeViewModel(this._transportation);

  @override
  void didTapCancel() {
    onTapCancel?.call();
  }

  @override
  void didTapSkipStep() {
    _transportation.packageSize = null;
    onTapSkipStep?.call();
  }

  @override
  void didTapGoForward() {
    onTapGoForward?.call();
  }

  @override
  void updatePackageSize(PackageSize? value) {
    _transportation.packageSize = value;
    notifyListeners();
  }

  @override
  String packageSizeIconByType(PackageSize packageSize) {
    switch (packageSize) {
      case PackageSize.backpack:
        return Constants.backpackIconPath;
      case PackageSize.bigBox:
        return Constants.bigBoxIconPath;
      case PackageSize.bigSuitcase:
        return Constants.bigSuitcaseIconPath;
      case PackageSize.book:
        return Constants.bookIconPath;
      case PackageSize.envelope:
        return Constants.envelopeIconPath;
      case PackageSize.shoeBox:
        return Constants.shoeBoxIconPath;
    }
  }

  @override
  String packageSizeNameByType(PackageSize packageSize, Localization l10n) {
    switch (packageSize) {
      case PackageSize.backpack:
        return l10n.backpack;
      case PackageSize.bigBox:
        return l10n.bigBox;
      case PackageSize.bigSuitcase:
        return l10n.bigSuitcase;
      case PackageSize.book:
        return l10n.book;
      case PackageSize.envelope:
        return l10n.envelope;
      case PackageSize.shoeBox:
        return l10n.shoeBox;
    }
  }

  @override
  String packageSizeDescriptionByType(PackageSize packageSize, Localization l10n) {
    switch (packageSize) {
      case PackageSize.backpack:
        return l10n.emptyPackageSize;
      case PackageSize.bigBox:
        return l10n.emptyPackageSize;
      case PackageSize.bigSuitcase:
        return l10n.emptyPackageSize;
      case PackageSize.book:
        return l10n.emptyPackageSize;
      case PackageSize.envelope:
        return l10n.emptyPackageSize;
      case PackageSize.shoeBox:
        return l10n.emptyPackageSize;
    }
  }
}

enum PackageSize {
  envelope,
  book,
  shoeBox,
  backpack,
  bigSuitcase,
  bigBox,
}
