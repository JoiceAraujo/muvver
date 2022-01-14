import 'minimum_price_view.dart';

abstract class MinimumPriceProtocol extends MinimumPriceViewModelProtocol {
  void Function()? onTapCancel;
  void Function()? onTapGoForward;
}

class MinimumPriceViewModel extends MinimumPriceProtocol {
  double _price = 100;
  final double _minimumPrice = 10;
  final double _maximumPrice = 220;

  @override
  double get price => _price;

  @override
  double get minimumPrice => _minimumPrice;

  @override
  double get maximumPrice => _maximumPrice;

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

    _price = double.parse(price.toStringAsFixed(2));
    notifyListeners();
  }
}
