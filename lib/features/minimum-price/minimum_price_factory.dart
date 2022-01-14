import 'package:flutter/widgets.dart';

import 'minimum-price/minimum_price_view_controller.dart';
import 'minimum-price/minimum_price_view_model.dart';

class MinimumPriceFactory {
  static StatefulWidget minimumPrice() {
    final viewModel = MinimumPriceViewModel();
    return MinimumPriceViewController(viewModel: viewModel);
  }
}
