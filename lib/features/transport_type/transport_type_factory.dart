import 'package:flutter/material.dart';

import 'transport_type/transport_type_view_controller.dart';
import 'transport_type/transport_type_view_model.dart';

class TransportTypeFactory {
  static StatefulWidget transportType() {
    final viewModel = TransportTypeViewModel();
    return TransportTypeViewController(viewModel: viewModel);
  }
}
