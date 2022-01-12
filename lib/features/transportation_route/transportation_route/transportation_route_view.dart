import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../support/components/date_selection.dart';
import '../../../support/components/gradient_app_bar.dart';
import '../../../support/style/application_colors.dart';
import '../../../support/style/application_typography.dart';

abstract class TransportationRouteViewModelProtocol with ChangeNotifier {
  void searchCity();
  void didTapCancel();
  void didTapGoForward();
  void updateArrivalDate(DateTime? date);
  void updateDepartureDate(DateTime? date);
}

class TransportationRouteView extends StatelessWidget {
  final TransportationRouteViewModelProtocol viewModel;
  final TextEditingController _originCity = TextEditingController();
  final TextEditingController _destinationCity = TextEditingController();

  TransportationRouteView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context)!;

    return Scaffold(
      body: Column(
        children: [
          GradientAppBar(
            helpText: Text(
              l10n.travelRoute,
              style: ApplicationTypography.titilliumWeb20RegularWhite,
            ),
            middle: Text(
              l10n.traveler,
              style: ApplicationTypography.titilliumWeb16RegularWhite,
            ),
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: ApplicationColors.white,
              ),
            ),
            trailing: TextButton(
              onPressed: viewModel.didTapCancel,
              child: Text(
                l10n.cancel,
                style: ApplicationTypography.titilliumWeb14BoldWhite,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              children: [
                Text(
                  l10n.dateRouteTravel,
                  style: ApplicationTypography.titilliumWeb16BoldGray,
                ),
                const SizedBox(height: 16),
                DateSelection(
                  updateArrivalDate: viewModel.updateArrivalDate,
                  updateDepartureDate: viewModel.updateDepartureDate,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onTap: viewModel.searchCity,
                  controller: _originCity,
                  keyboardType: TextInputType.text,
                  cursorColor: ApplicationColors.gray12,
                  decoration: InputDecoration(
                    labelText: l10n.originCity,
                    prefixIcon: const Icon(Icons.search, color: ApplicationColors.gray),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onTap: viewModel.searchCity,
                  controller: _destinationCity,
                  keyboardType: TextInputType.text,
                  cursorColor: ApplicationColors.gray12,
                  decoration: InputDecoration(
                    labelText: l10n.destinationCity,
                    prefixIcon: const Icon(Icons.search, color: ApplicationColors.gray),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: Text(l10n.goForward),
                  onPressed: viewModel.didTapGoForward,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
