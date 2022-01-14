import 'package:flutter/widgets.dart';

import 'package-weight/package_weight_view_controller.dart';
import 'package-weight/package_weight_view_model.dart';

class PackageWeightFactory {
  static StatefulWidget packageWeight() {
    final viewModel = PackageWeightViewModel();
    return PackageWeightViewController(viewModel: viewModel);
  }
}
