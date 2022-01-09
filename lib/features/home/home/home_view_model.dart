import 'home_view.dart';

abstract class HomeProtocol extends HomeViewModelProtocol {
  void Function()? onTapTraveler;
}

class HomeViewModel extends HomeProtocol {
  @override
  void didTapTraveler() {
    onTapTraveler?.call();
  }
}
