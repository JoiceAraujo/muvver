import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:intl/intl.dart';

import '../style/application_typography.dart';

class DateSelection extends StatefulWidget {
  final void Function(DateTime? date) updateArrivalDate;
  final void Function(DateTime? date) updateDepartureDate;

  const DateSelection({
    Key? key,
    required this.updateArrivalDate,
    required this.updateDepartureDate,
  }) : super(key: key);

  @override
  _DateSelectionState createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  final TextEditingController _arrivalDate = TextEditingController();
  final TextEditingController _departureDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context)!;

    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => _updateDepartureDate(l10n),
            child: TextFormField(
              enabled: false,
              style: ApplicationTypography.titilliumWeb15RegularGray,
              controller: _departureDate,
              decoration: InputDecoration(labelText: l10n.departureDate),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: InkWell(
            onTap: () => _updateArrivalDate(l10n),
            child: TextFormField(
              enabled: false,
              style: ApplicationTypography.titilliumWeb15RegularGray,
              controller: _arrivalDate,
              decoration: InputDecoration(labelText: l10n.arrivalDate),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _updateArrivalDate(Localization l10n) async {
    final pickedDate = await _datePicker();
    widget.updateArrivalDate(pickedDate);

    if (pickedDate != null) {
      setState(() {
        _arrivalDate.text = DateFormat(l10n.dateFormat).format(pickedDate);
      });
    }
  }

  Future<void> _updateDepartureDate(Localization l10n) async {
    final pickedDate = await _datePicker();
    widget.updateDepartureDate(pickedDate);

    if (pickedDate != null) {
      setState(() {
        _departureDate.text = DateFormat(l10n.dateFormat).format(pickedDate);
      });
    }
  }

  Future<DateTime?> _datePicker() async {
    return await showDatePicker(
      context: context,
      lastDate: DateTime(2050),
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
    );
  }
}
