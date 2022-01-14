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
}
