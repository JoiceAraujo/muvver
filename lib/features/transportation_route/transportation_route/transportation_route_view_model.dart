import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:intl/intl.dart';

import '../../../models/transportation.dart';
import '../domain/get_predictions_use_case.dart';
import 'transportation_route_view.dart';

abstract class TransportationRouteProtocol extends TransportationRouteViewModelProtocol {
  Transportation get transportation;

  void Function()? onTapCancel;
  void Function()? onTapGoForward;
}

class TransportationRouteViewModel extends TransportationRouteProtocol {
  final Transportation _transportation;
  final GetPredictionsUseCaseProtocol useCase;
  List<String>? _predictions;

  @override
  List<String> get predictions => _predictions ?? [];

  @override
  Transportation get transportation => _transportation;

  @override
  String? get originCity => _transportation.originCity;

  @override
  String? get destinationCity => _transportation.destinationCity;

  TransportationRouteViewModel(this._transportation, {required this.useCase});

  void _searchCity(String? input) {
    useCase.execute(
      input: input ?? '',
      success: (result) {
        _predictions = result;
        notifyListeners();
      },
      failure: (_) {},
    );
  }

  @override
  void didTapCancel() {
    onTapCancel?.call();
  }

  @override
  void didTapGoForward() {
    onTapGoForward?.call();
  }

  @override
  void updateArrivalDate(DateTime? date) {
    _transportation.arrivalDate = date;
  }

  @override
  void updateDepartureDate(DateTime? date) {
    _transportation.departureDate = date;
  }

  @override
  void updateOriginCity(String? originCity) {
    _transportation.originCity = originCity;
    _searchCity(originCity);
  }

  @override
  void updateDestinationCity(String? destinationCity) {
    _transportation.destinationCity = destinationCity;
    _searchCity(destinationCity);
  }

  @override
  String? arrivalValidator(Localization l10n) {
    if (_transportation.arrivalDate == null) return l10n.emptyFieldMessage;

    if (_transportation.arrivalDate != null && _transportation.departureDate != null) {
      if (_transportation.arrivalDate?.isBefore(_transportation.departureDate ?? DateTime.now()) ?? false) {
        return l10n.arrivalBeforeDepartureMessage;
      }
    }
  }

  @override
  String? departureValidator(Localization l10n) {
    if (_transportation.departureDate == null) return l10n.emptyFieldMessage;

    if (_transportation.arrivalDate != null && _transportation.departureDate != null) {
      if (_transportation.departureDate?.isAfter(_transportation.arrivalDate ?? DateTime.now()) ?? false) {
        return l10n.departureAfterArrivalMessage;
      }
    }
  }

  @override
  String? originCityValidator(Localization l10n) {
    if (_transportation.originCity == null) return l10n.emptyFieldMessage;
  }

  @override
  String? destinationCityValidator(Localization l10n) {
    if (_transportation.destinationCity == null) return l10n.emptyFieldMessage;
  }

  @override
  String? formattedArrivalDate(Localization l10n) {
    if (_transportation.arrivalDate == null) return '';

    return DateFormat(l10n.dateFormat).format(_transportation.arrivalDate ?? DateTime.now());
  }

  @override
  String? formattedDepartureDate(Localization l10n) {
    if (_transportation.departureDate == null) return '';

    return DateFormat(l10n.dateFormat).format(_transportation.departureDate ?? DateTime.now());
  }
}
