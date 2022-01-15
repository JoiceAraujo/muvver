import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../support/components/date_selection.dart';
import '../../../support/components/gradient_app_bar.dart';
import '../../../support/style/application_colors.dart';
import '../../../support/style/application_typography.dart';

abstract class TransportationRouteViewModelProtocol with ChangeNotifier {
  String? get originCity;
  String? get destinationCity;
  List<String> get predictions;

  void didTapCancel();
  void didTapGoForward();
  void updateArrivalDate(DateTime? date);
  void updateDepartureDate(DateTime? date);
  void updateOriginCity(String? originCity);
  void updateDestinationCity(String? destinationCity);
  String? arrivalValidator(Localization l10n);
  String? departureValidator(Localization l10n);
  String? originCityValidator(Localization l10n);
  String? destinationCityValidator(Localization l10n);
  String? formattedArrivalDate(Localization l10n);
  String? formattedDepartureDate(Localization l10n);
}

class TransportationRouteView extends StatelessWidget {
  final TransportationRouteViewModelProtocol viewModel;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _originCityController = TextEditingController(text: viewModel.originCity);
  late final TextEditingController _destinationCityController = TextEditingController(text: viewModel.destinationCity);

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
            child: Form(
              key: _formKey,
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
                    arrivalDate: viewModel.formattedArrivalDate(l10n),
                    updateDepartureDate: viewModel.updateDepartureDate,
                    departureDate: viewModel.formattedDepartureDate(l10n),
                    arrivalValidator: () => viewModel.arrivalValidator(l10n),
                    departureValidator: () => viewModel.departureValidator(l10n),
                  ),
                  const SizedBox(height: 20),
                  AnimatedBuilder(
                    animation: viewModel,
                    builder: (_, __) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TypeAheadFormField(
                            itemBuilder: _suggestionItemBuilder,
                            validator: (_) => viewModel.originCityValidator(l10n),
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
                          const Text(''),
                          const SizedBox(height: 20),
                          TypeAheadFormField(
                            itemBuilder: _suggestionItemBuilder,
                            suggestionsCallback: (pattern) => viewModel.predictions,
                            validator: (_) => viewModel.destinationCityValidator(l10n),
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: _destinationCityController,
                              cursorColor: ApplicationColors.gray12,
                              onChanged: viewModel.updateDestinationCity,
                              decoration: _getTextFieldDecoration(l10n.destinationCity),
                            ),
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
                    onPressed: _didTapGoForward,
                  ),
                ],
              ),
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

  void _didTapGoForward() {
    if (_formKey.currentState?.validate() ?? false) {
      viewModel.didTapGoForward();
    }
  }
}
