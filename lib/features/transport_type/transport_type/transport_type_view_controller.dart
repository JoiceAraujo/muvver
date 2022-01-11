import 'package:flutter/material.dart';

import 'transport_type_view.dart';
import 'transport_type_view_model.dart';

class TransportTypeViewController<ViewModel extends TransportTypeProtocol> extends StatefulWidget {
  final ViewModel viewModel;
  static const String route = '/transport_type';

  const TransportTypeViewController({Key? key, required this.viewModel}) : super(key: key);

  @override
  _TransportTypeViewControllerState createState() => _TransportTypeViewControllerState();
}

class _TransportTypeViewControllerState extends State<TransportTypeViewController> {
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TransportTypeView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapGoForward = () {
      // TODO Implement onTapGoForward
      debugPrint('onTapGoForward');
    };
  }
}
