import 'package:flutter/widgets.dart';

import '../../api/routes/places_routes.dart';
import '../../models/transportation.dart';
import 'domain/get_predictions_use_case.dart';
import 'transportation_route/transportation_route_view_controller.dart';
import 'transportation_route/transportation_route_view_model.dart';

class TransportationRouteFactory {
  static StatefulWidget transportationRoute(Transportation transportation) {
    final routes = PlacesRoutes();
    final useCase = GetPredictionsUseCase(routes: routes);
    final viewModel = TransportationRouteViewModel(transportation, useCase: useCase);
    return TransportationRouteViewController(viewModel: viewModel);
  }
}
