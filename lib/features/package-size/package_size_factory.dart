import 'package:flutter/material.dart';

import '../../models/transportation.dart';
import 'package-size/package_size_view_controller.dart';
import 'package-size/package_size_view_model.dart';

class PackageSizeFactory {
  static StatefulWidget packageSize(Transportation transportation) {
    final viewModel = PackageSizeViewModel(transportation);
    return PackageSizeViewController(viewModel: viewModel);
  }
}
