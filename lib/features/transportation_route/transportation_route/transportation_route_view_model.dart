import '../domain/get_predictions_use_case.dart';
import 'transportation_route_view.dart';

abstract class TransportationRouteProtocol extends TransportationRouteViewModelProtocol {
  void Function()? onTapCancel;
  void Function()? onTapGoForward;
}

class TransportationRouteViewModel extends TransportationRouteProtocol {
  final GetPredictionsUseCaseProtocol useCase;
  String? _originCity;
  String? _destinationCity;
  DateTime? _arrivalDate;
  DateTime? _departureDate;
  List<String>? _predictions;

  @override
  List<String> get predictions => _predictions ?? [];

  TransportationRouteViewModel({required this.useCase});

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
    _arrivalDate = date;
  }

  @override
  void updateDepartureDate(DateTime? date) {
    _departureDate = date;
  }

  @override
  void updateOriginCity(String? originCity) {
    _originCity = originCity;
    _searchCity(originCity);
  }

  @override
  void updateDestinationCity(String? destinationCity) {
    _destinationCity = destinationCity;
    _searchCity(destinationCity);
  }
}
