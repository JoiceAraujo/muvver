import 'package:flutter/widgets.dart';

import 'transportation_route/transportation_route_view_controller.dart';
import 'transportation_route/transportation_route_view_model.dart';

class TransportationRouteFactory {
  static StatefulWidget transportationRoute() {
    final viewModel = TransportationRouteViewModel();
    return TransportationRouteViewController(viewModel: viewModel);
  }
}
