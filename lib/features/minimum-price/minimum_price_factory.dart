import 'package:flutter/widgets.dart';

import '../../models/transportation.dart';
import 'minimum-price/minimum_price_view_controller.dart';
import 'minimum-price/minimum_price_view_model.dart';

class MinimumPriceFactory {
  static StatefulWidget minimumPrice(Transportation transportation) {
    final viewModel = MinimumPriceViewModel(transportation);
    return MinimumPriceViewController(viewModel: viewModel);
  }
}
