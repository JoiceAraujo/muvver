import 'transportation_success_view.dart';

abstract class TransportationSuccessProtocol extends TransportationSuccessViewModelProtocol {
  void Function()? onTapViewPackages;
}

class TransportationSuccessViewModel extends TransportationSuccessProtocol {
  @override
  void dipTapViewPackages() {
    onTapViewPackages?.call();
  }
}
