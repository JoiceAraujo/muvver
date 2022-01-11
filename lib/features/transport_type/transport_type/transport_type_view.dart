import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../support/components/gradient_app_bar.dart';
import '../../../support/components/radio_list.dart';
import '../../../support/style/application_typography.dart';
import 'transport_type_view_model.dart';

abstract class TransportTypeViewModelProtocol with ChangeNotifier {
  TransportType? get transportType;

  void didTapGoForward();
  void updateTransportType(TransportType? value);
  String transportIconByType(TransportType transportType);
  String transportNameByType(TransportType transportType, Localization l10n);
}

class TransportTypeView extends StatelessWidget {
  final TransportTypeViewModelProtocol viewModel;

  const TransportTypeView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context)!;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GradientAppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            middle: Text(
              l10n.traveler,
              textAlign: TextAlign.center,
              style: ApplicationTypography.titilliumWeb16RegularWhite,
            ),
            helpText: Text(
              l10n.transportTypeTravel,
              style: ApplicationTypography.titilliumWeb20RegularWhite,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              l10n.transport,
              style: ApplicationTypography.titilliumWeb16BoldGray,
            ),
          ),
          const SizedBox(height: 16),
          AnimatedBuilder(
            animation: viewModel,
            builder: (_, __) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RadioList<TransportType>(
                    values: TransportType.values,
                    selectedValue: viewModel.transportType,
                    onChanged: viewModel.updateTransportType,
                    nameByType: viewModel.transportNameByType,
                    iconByType: viewModel.transportIconByType,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              child: Text(l10n.goForward),
              onPressed: viewModel.didTapGoForward,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
