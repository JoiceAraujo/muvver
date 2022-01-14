import 'package:flutter/material.dart';

import '../../home/home/home_view_controller.dart';
import 'package_weight_view.dart';
import 'package_weight_view_model.dart';

class PackageWeightViewController<ViewModel extends PackageWeightProtocol> extends StatefulWidget {
  final ViewModel viewModel;
  static const String route = '/package_weight';

  const PackageWeightViewController({Key? key, required this.viewModel}) : super(key: key);

  @override
  _PackageWeightViewControllerState createState() => _PackageWeightViewControllerState();
}

class _PackageWeightViewControllerState extends State<PackageWeightViewController> {
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PackageWeightView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapCancel = () {
      Navigator.popUntil(context, ModalRoute.withName(HomeViewController.route));
    };

    widget.viewModel.onTapSkipStep = () {
      // TODO: Implements price view
      debugPrint('Skip step');
    };

    widget.viewModel.onTapGoForward = () {
      // TODO: Implements price view
      debugPrint('Go Forward');
    };
  }
}
