import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../support/components/date_selection.dart';
import '../../../support/components/gradient_app_bar.dart';
import '../../../support/style/application_colors.dart';
import '../../../support/style/application_typography.dart';

abstract class TransportationRouteViewModelProtocol with ChangeNotifier {
  List<String> get predictions;

  void didTapCancel();
  void didTapGoForward();
  void updateArrivalDate(DateTime? date);
  void updateDepartureDate(DateTime? date);
  void updateOriginCity(String? originCity);
  void updateDestinationCity(String? destinationCity);
}

class TransportationRouteView extends StatelessWidget {
  final TransportationRouteViewModelProtocol viewModel;
  final TextEditingController _originCityController = TextEditingController();
  final TextEditingController _destinationCityController = TextEditingController();

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
                const SizedBox(height: 16),
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
                AnimatedBuilder(
                  animation: viewModel,
                  builder: (_, __) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TypeAheadField(
                          itemBuilder: _suggestionItemBuilder,
                          suggestionsCallback: (pattern) => viewModel.predictions,
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: _originCityController,
                            cursorColor: ApplicationColors.gray12,
                            onChanged: viewModel.updateOriginCity,
                            decoration: _getTextFieldDecoration(l10n.originCity),
                          ),
                          onSuggestionSelected: (String selection) {
                            _originCityController.text = selection;
                            viewModel.updateOriginCity(selection);
                          },
                        ),
                        const SizedBox(height: 20),
                        TypeAheadField(
                          itemBuilder: _suggestionItemBuilder,
                          suggestionsCallback: (pattern) => viewModel.predictions,
                          textFieldConfiguration: TextFieldConfiguration(
                              controller: _destinationCityController,
                              cursorColor: ApplicationColors.gray12,
                              onChanged: viewModel.updateDestinationCity,
                              decoration: _getTextFieldDecoration(l10n.destinationCity)),
                          onSuggestionSelected: (String selection) {
                            _destinationCityController.text = selection;
                            viewModel.updateDestinationCity(selection);
                          },
                        ),
                      ],
                    );
                  },
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

  Widget _suggestionItemBuilder(BuildContext context, String suggestion) {
    return ListTile(title: Text(suggestion));
  }

  InputDecoration _getTextFieldDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: ApplicationTypography.titilliumWeb16RegularGray,
      prefixIcon: const Icon(Icons.search, color: ApplicationColors.gray),
    );
  }
}
