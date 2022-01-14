import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import '../../../support/components/gradient_app_bar.dart';
import '../../../support/style/application_colors.dart';
import '../../../support/style/application_typography.dart';

abstract class MinimumPriceViewModelProtocol with ChangeNotifier {
  double get price;
  double get minimumPrice;
  double get maximumPrice;

  void didTapCancel();
  void didTapGoForward();
  void updatePrice(double? price);
}

class MinimumPriceView extends StatelessWidget {
  final MinimumPriceViewModelProtocol viewModel;
  late final TextEditingController _priceController = TextEditingController(text: '${viewModel.price}');

  MinimumPriceView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context)!;

    return Scaffold(
      body: Column(
        children: [
          GradientAppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: ApplicationColors.white,
              ),
            ),
            middle: Text(
              l10n.beMuvver,
              style: ApplicationTypography.titilliumWeb16RegularWhite,
            ),
            trailing: TextButton(
              onPressed: viewModel.didTapCancel,
              child: Text(
                l10n.cancel,
                style: ApplicationTypography.titilliumWeb14BoldWhite,
              ),
            ),
            helpText: Text(
              l10n.minimumPriceDisplacement,
              style: ApplicationTypography.titilliumWeb20RegularWhite,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    l10n.deliveryPrice,
                    style: ApplicationTypography.titilliumWeb16BoldGray,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.suggestedValue,
                    textAlign: TextAlign.center,
                    style: ApplicationTypography.titilliumWeb12RegularGray32,
                  ),
                  const SizedBox(height: 8),
                  AnimatedBuilder(
                    animation: viewModel,
                    builder: (_, __) {
                      return Column(
                        children: [
                          Slider(
                            value: viewModel.price,
                            onChanged: _updatePrice,
                            min: viewModel.minimumPrice,
                            max: viewModel.maximumPrice,
                            thumbColor: ApplicationColors.gray,
                            activeColor: ApplicationColors.gray,
                            inactiveColor: ApplicationColors.gray12,
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 60,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              onChanged: _updatePriceLabel,
                              controller: _priceController,
                              keyboardType: TextInputType.number,
                              cursorColor: ApplicationColors.gray,
                              decoration: _textFormFieldDecoration(l10n),
                              style: ApplicationTypography.titilliumWeb14RegularGray,
                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[.0-9]'))],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.specificPrice,
                    textAlign: TextAlign.center,
                    style: ApplicationTypography.titilliumWeb12RegularGray54,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    child: Text(l10n.goForward),
                    onPressed: viewModel.didTapGoForward,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _textFormFieldDecoration(Localization l10n) {
    return const InputDecoration(
      prefixText: 'R\$',
      enabledBorder: UnderlineInputBorder(),
      focusedBorder: UnderlineInputBorder(),
      disabledBorder: UnderlineInputBorder(),
    );
  }

  void _updatePrice(double value) {
    viewModel.updatePrice(value);
    _priceController.text = value.toStringAsFixed(2);
  }

  void _updatePriceLabel(String value) {
    final price = double.tryParse(value);
    viewModel.updatePrice(price);
  }
}
