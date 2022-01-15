import 'package:flutter/widgets.dart';

import '../../models/transportation.dart';
import 'package-weight/package_weight_view_controller.dart';
import 'package-weight/package_weight_view_model.dart';

class PackageWeightFactory {
  static StatefulWidget packageWeight(Transportation transportation) {
    final viewModel = PackageWeightViewModel(transportation);
    return PackageWeightViewController(viewModel: viewModel);
  }
}
