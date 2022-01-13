import 'package:flutter/material.dart';

import '../../features/home/home/home_view_controller.dart';
import '../../features/home/home_factory.dart';
import '../../features/package-size/package-size/package_size_view_controller.dart';
import '../../features/package-size/package_size_factory.dart';
import '../../features/transport_type/transport_type/transport_type_view_controller.dart';
import '../../features/transport_type/transport_type_factory.dart';
import '../../features/transportation_route/transportation_route/transportation_route_view_controller.dart';
import '../../features/transportation_route/transportation_route_factory.dart';

class MobileRouter {
  static const String initialRoute = HomeViewController.route;

  static final Map<String, WidgetBuilder> routes = {
    HomeViewController.route: (_) => HomeFactory.home(),
    TransportTypeViewController.route: (_) => TransportTypeFactory.transportType(),
    TransportationRouteViewController.route: (_) => TransportationRouteFactory.transportationRoute(),
    PackageSizeViewController.route: (_) => PackageSizeFactory.packageSize(),
  };
}
