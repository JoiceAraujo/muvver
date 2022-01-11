import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../style/application_colors.dart';
import '../style/application_typography.dart';

class RadioList<T> extends StatelessWidget {
  final List<T> values;
  final T? selectedValue;
  final void Function(T? value) onChanged;
  final String Function(T value) iconByType;
  final String Function(T value, Localization l10n) nameByType;

  const RadioList({
    Key? key,
    required this.values,
    required this.selectedValue,
    required this.onChanged,
    required this.iconByType,
    required this.nameByType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: values.length,
      itemBuilder: _itemBuilder,
      separatorBuilder: _separatorBuilder,
    );
  }

  Widget _separatorBuilder(context, index) {
    return const Divider(
      height: 32,
      color: ApplicationColors.gray12,
    );
  }

  Widget _itemBuilder(context, index) {
    final value = values.elementAt(index);
    final l10n = Localization.of(context)!;

    return Row(
      children: [
        SvgPicture.asset(iconByType(value)),
        const SizedBox(width: 16),
        Text(
          nameByType(value, l10n),
          style: ApplicationTypography.titilliumWeb12BoldGray,
        ),
        const Spacer(),
        Radio(
          value: value,
          onChanged: onChanged,
          groupValue: selectedValue,
          activeColor: ApplicationColors.green,
        ),
      ],
    );
  }
}
