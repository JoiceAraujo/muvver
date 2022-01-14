import 'package:flutter/material.dart';

import '../../features/home/home/home_view_controller.dart';
import '../../features/home/home_factory.dart';
import '../../features/minimum-price/minimum-price/minimum_price_view_controller.dart';
import '../../features/minimum-price/minimum_price_factory.dart';
import '../../features/package-size/package-size/package_size_view_controller.dart';
import '../../features/package-size/package_size_factory.dart';
import '../../features/package-weight/package-weight/package_weight_view_controller.dart';
import '../../features/package-weight/package_weight_factory.dart';
import '../../features/transport_type/transport_type/transport_type_view_controller.dart';
import '../../features/transport_type/transport_type_factory.dart';
import '../../features/transportation-success/transportation-success/transportation_success_view_controller.dart';
import '../../features/transportation-success/transportation_success_factory.dart';
import '../../features/transportation_route/transportation_route/transportation_route_view_controller.dart';
import '../../features/transportation_route/transportation_route_factory.dart';
import '../../models/transportation.dart';

class MobileRouter {
  static const String initialRoute = HomeViewController.route;

  static final Map<String, WidgetBuilder> routes = {
    HomeViewController.route: _homeViewController,
    TransportTypeViewController.route: _transportTypeViewController,
    TransportationRouteViewController.route: _transportationRouteViewController,
    PackageSizeViewController.route: _packageSizeViewController,
    PackageWeightViewController.route: _packageWeightViewController,
    MinimumPriceViewController.route: _minimumPriceViewController,
    TransportationSuccessViewController.route: _transportationSuccessViewController,
  };

  static Widget _homeViewController(BuildContext context) {
    return HomeFactory.home();
  }

  static Widget _transportTypeViewController(BuildContext context) {
    return TransportTypeFactory.transportType();
  }

  static Widget _transportationRouteViewController(BuildContext context) {
    final transportation = ModalRoute.of(context)?.settings.arguments as Transportation;

    return TransportationRouteFactory.transportationRoute(transportation);
  }

  static Widget _packageSizeViewController(BuildContext context) {
    final transportation = ModalRoute.of(context)?.settings.arguments as Transportation;

    return PackageSizeFactory.packageSize(transportation);
  }

  static Widget _packageWeightViewController(BuildContext context) {
    final transportation = ModalRoute.of(context)?.settings.arguments as Transportation;

    return PackageWeightFactory.packageWeight(transportation);
  }

  static Widget _minimumPriceViewController(BuildContext context) {
    final transportation = ModalRoute.of(context)?.settings.arguments as Transportation;

    return MinimumPriceFactory.minimumPrice(transportation);
  }

  static Widget _transportationSuccessViewController(BuildContext context) {
    return TransportationSuccessFactory.transportationSuccess();
  }
}
