import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../models/transportation.dart';
import '../../../support/utils/constants.dart';
import 'transport_type_view.dart';

abstract class TransportTypeProtocol extends TransportTypeViewModelProtocol {
  Transportation get transportation;

  void Function()? onTapGoForward;
}

class TransportTypeViewModel extends TransportTypeProtocol {
  final Transportation _transportation = Transportation(transportType: TransportType.car);

  @override
  Transportation get transportation => _transportation;

  @override
  TransportType? get transportType => _transportation.transportType;

  @override
  void didTapGoForward() {
    onTapGoForward?.call();
  }

  @override
  void updateTransportType(TransportType? value) {
    _transportation.transportType = value;
    notifyListeners();
  }

  @override
  String transportIconByType(TransportType transportType) {
    switch (transportType) {
      case TransportType.airplane:
        return Constants.airplaneIconPath;
      case TransportType.bike:
        return Constants.bikeIconPath;
      case TransportType.boat:
        return Constants.boatIconPath;
      case TransportType.bus:
        return Constants.busIconPath;
      case TransportType.car:
        return Constants.carIconPath;
      case TransportType.motorcycle:
        return Constants.motorcycleIconPath;
      case TransportType.train:
        return Constants.trainIconPath;
      case TransportType.truck:
        return Constants.truckIconPath;
      case TransportType.van:
        return Constants.vanIconPath;
    }
  }

  @override
  String transportNameByType(TransportType transportType, Localization l10n) {
    switch (transportType) {
      case TransportType.airplane:
        return l10n.airplane;
      case TransportType.bike:
        return l10n.bike;
      case TransportType.boat:
        return l10n.boat;
      case TransportType.bus:
        return l10n.bus;
      case TransportType.car:
        return l10n.car;
      case TransportType.motorcycle:
        return l10n.motorcycle;
      case TransportType.train:
        return l10n.train;
      case TransportType.truck:
        return l10n.truck;
      case TransportType.van:
        return l10n.van;
    }
  }
}

enum TransportType {
  car,
  airplane,
  truck,
  van,
  motorcycle,
  bike,
  train,
  bus,
  boat,
}
