import 'package:flutter/material.dart';

import '../../home/home/home_view_controller.dart';
import 'transportation_success_view.dart';
import 'transportation_success_view_model.dart';

class TransportationSuccessViewController<ViewModel extends TransportationSuccessProtocol> extends StatefulWidget {
  final ViewModel viewModel;
  static const String route = '/transportation_success';

  const TransportationSuccessViewController({Key? key, required this.viewModel}) : super(key: key);

  @override
  _TransportationSuccessViewControllerState createState() => _TransportationSuccessViewControllerState();
}

class _TransportationSuccessViewControllerState extends State<TransportationSuccessViewController> {
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TransportationSuccessView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapViewPackages = () {
      Navigator.pushNamed(context, HomeViewController.route);
    };
  }
}
