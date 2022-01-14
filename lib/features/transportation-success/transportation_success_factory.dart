import 'package:flutter/widgets.dart';

import 'transportation-success/transportation_success_view_controller.dart';
import 'transportation-success/transportation_success_view_model.dart';

class TransportationSuccessFactory {
  static StatefulWidget transportationSuccess() {
    final viewModel = TransportationSuccessViewModel();
    return TransportationSuccessViewController(viewModel: viewModel);
  }
}
