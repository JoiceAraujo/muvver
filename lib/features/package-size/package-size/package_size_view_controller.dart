import 'package:flutter/material.dart';

import '../../home/home/home_view_controller.dart';
import '../../package-weight/package-weight/package_weight_view_controller.dart';
import 'package_size_view.dart';
import 'package_size_view_model.dart';

class PackageSizeViewController<ViewModel extends PackageSizeProtocol> extends StatefulWidget {
  final ViewModel viewModel;
  static const String route = '/package_size';

  const PackageSizeViewController({Key? key, required this.viewModel}) : super(key: key);

  @override
  _PackageSizeViewControllerState createState() => _PackageSizeViewControllerState();
}

class _PackageSizeViewControllerState extends State<PackageSizeViewController> {
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PackageSizeView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapCancel = () {
      Navigator.popUntil(context, ModalRoute.withName(HomeViewController.route));
    };

    widget.viewModel.onTapSkipStep = () {
      Navigator.pushNamed(context, PackageWeightViewController.route);
    };

    widget.viewModel.onTapGoForward = () {
      Navigator.pushNamed(context, PackageWeightViewController.route);
    };
  }
}
