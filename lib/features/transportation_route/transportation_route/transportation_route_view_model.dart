import 'transportation_route_view.dart';

abstract class TransportationRouteProtocol extends TransportationRouteViewModelProtocol {
  void Function()? onTapCancel;
  void Function()? onTapGoForward;
}

class TransportationRouteViewModel extends TransportationRouteProtocol {
  DateTime? _arrivalDate;
  DateTime? _departureDate;

  @override
  void searchCity() {
    // TODO: implement searchCity
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
}
