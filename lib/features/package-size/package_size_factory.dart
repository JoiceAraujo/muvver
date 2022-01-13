import 'package:flutter/material.dart';

import 'package-size/package_size_view_controller.dart';
import 'package-size/package_size_view_model.dart';

class PackageSizeFactory {
  static StatefulWidget packageSize() {
    final viewModel = PackageSizeViewModel();
    return PackageSizeViewController(viewModel: viewModel);
  }
}
