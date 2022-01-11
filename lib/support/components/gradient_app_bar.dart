import 'package:flutter/material.dart';

import 'gradient_container.dart';

class GradientAppBar extends StatelessWidget {
  final Widget leading;
  final Widget? middle;
  final Widget? trailing;
  final Widget? helpText;

  const GradientAppBar({
    Key? key,
    this.middle,
    this.helpText,
    this.trailing,
    required this.leading,
  }) : super(key: key);

  Widget get _helpText => helpText ?? Container();

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: kToolbarHeight,
                child: NavigationToolbar(
                  middle: middle,
                  leading: leading,
                  trailing: trailing,
                ),
              ),
              _helpText
            ],
          ),
        ),
      ),
    );
  }
}
