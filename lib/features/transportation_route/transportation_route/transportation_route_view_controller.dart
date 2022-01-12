import 'package:flutter/material.dart';

import '../../home/home/home_view_controller.dart';
import 'transportation_route_view.dart';
import 'transportation_route_view_model.dart';

class TransportationRouteViewController<ViewModel extends TransportationRouteProtocol> extends StatefulWidget {
  final ViewModel viewModel;
  static const String route = '/transportation_route';

  const TransportationRouteViewController({Key? key, required this.viewModel}) : super(key: key);

  @override
  _TransportationRouteViewControllerState createState() => _TransportationRouteViewControllerState();
}

class _TransportationRouteViewControllerState extends State<TransportationRouteViewController> {
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TransportationRouteView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapGoForward = () {
      // TODO: Implementes navigator
      debugPrint('Navigator');
    };

    widget.viewModel.onTapCancel = () {
      Navigator.popUntil(context, ModalRoute.withName(HomeViewController.route));
    };
  }
}
