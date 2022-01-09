import 'package:flutter/material.dart';

import 'home_view.dart';
import 'home_view_model.dart';

class HomeViewController<ViewModel extends HomeProtocol> extends StatefulWidget {
  final ViewModel viewModel;
  static const String route = '/home';

  const HomeViewController({Key? key, required this.viewModel}) : super(key: key);

  @override
  _HomeViewControllerState createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapTraveler = () {
      // TODO: Navigate to TransportTypeView
      debugPrint('Navigate to TransportTypeView');
    };
  }
}
