import 'package:flutter/material.dart';

import '../../home/home/home_view_controller.dart';
import '../../transportation-success/transportation-success/transportation_success_view_controller.dart';
import 'minimum_price_view.dart';
import 'minimum_price_view_model.dart';

class MinimumPriceViewController<ViewModel extends MinimumPriceProtocol> extends StatefulWidget {
  final ViewModel viewModel;
  static const String route = '/minimum_price';

  const MinimumPriceViewController({Key? key, required this.viewModel}) : super(key: key);

  @override
  _MinimumPriceViewControllerState createState() => _MinimumPriceViewControllerState();
}

class _MinimumPriceViewControllerState extends State<MinimumPriceViewController> {
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MinimumPriceView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapCancel = () {
      Navigator.popUntil(context, ModalRoute.withName(HomeViewController.route));
    };

    widget.viewModel.onTapGoForward = () {
      debugPrint(widget.viewModel.transportation.toString());

      Navigator.pushNamedAndRemoveUntil(
        context,
        TransportationSuccessViewController.route,
        ModalRoute.withName(HomeViewController.route),
      );
    };
  }
}
