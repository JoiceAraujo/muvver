import '../features/package-size/package-size/package_size_view_model.dart';
import '../features/package-weight/package-weight/package_weight_view_model.dart';
import '../features/transport_type/transport_type/transport_type_view_model.dart';

class Transportation {
  TransportType? transportType;
  DateTime? departureDate;
  DateTime? arrivalDate;
  String? originCity;
  String? destinationCity;
  PackageSize? packageSize;
  PackageWeight? packageWeight;
  double? price;

  Transportation({
    this.transportType,
    this.departureDate,
    this.arrivalDate,
    this.originCity,
    this.destinationCity,
    this.packageSize,
    this.packageWeight,
    this.price,
  });

  @override
  String toString() {
    return '''
    --------- Transportation ---------
    Transport Type: $transportType
    Departure date: $departureDate
    Arrival date: $arrivalDate
    Origin city: $originCity
    Destination city: $destinationCity
    Package size: $packageSize
    Package weight: $packageWeight
    Price: $price
    ----------------------------------
    ''';
  }
}
