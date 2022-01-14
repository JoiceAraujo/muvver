import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:intl/intl.dart';

import '../style/application_typography.dart';

class DateSelection extends StatefulWidget {
  final String? arrivalDate;
  final String? departureDate;
  final String? Function()? arrivalValidator;
  final String? Function()? departureValidator;
  final void Function(DateTime? date) updateArrivalDate;
  final void Function(DateTime? date) updateDepartureDate;

  const DateSelection({
    Key? key,
    this.arrivalDate,
    this.departureDate,
    this.arrivalValidator,
    this.departureValidator,
    required this.updateArrivalDate,
    required this.updateDepartureDate,
  }) : super(key: key);

  @override
  _DateSelectionState createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  late final TextEditingController _arrivalDate = TextEditingController(text: widget.arrivalDate);
  late final TextEditingController _departureDate = TextEditingController(text: widget.departureDate);

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
              controller: _departureDate,
              validator: (_) => widget.departureValidator?.call(),
              style: ApplicationTypography.titilliumWeb15RegularGray,
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
              controller: _arrivalDate,
              validator: (_) => widget.arrivalValidator?.call(),
              style: ApplicationTypography.titilliumWeb15RegularGray,
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
    final now = DateTime.now();
    const fiftyYears = Duration(days: 18250);

    return await showDatePicker(
      firstDate: now,
      initialDate: now,
      context: context,
      lastDate: now.add(fiftyYears),
    );
  }
}
