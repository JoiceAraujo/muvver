import '../../../models/transportation.dart';
import 'minimum_price_view.dart';

abstract class MinimumPriceProtocol extends MinimumPriceViewModelProtocol {
  Transportation get transportation;

  void Function()? onTapCancel;
  void Function()? onTapGoForward;
}

class MinimumPriceViewModel extends MinimumPriceProtocol {
  final Transportation _transportation;
  final double _minimumPrice = 10;
  final double _maximumPrice = 220;

  @override
  Transportation get transportation => _transportation;

  @override
  double get price => _transportation.price ?? 100;

  @override
  double get minimumPrice => _minimumPrice;

  @override
  double get maximumPrice => _maximumPrice;

  MinimumPriceViewModel(this._transportation) {
    _transportation.price = 100;
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
  void updatePrice(double? price) {
    if (price == null || price < minimumPrice || price > maximumPrice) return;

    _transportation.price = double.parse(price.toStringAsFixed(2));
    notifyListeners();
  }
}
