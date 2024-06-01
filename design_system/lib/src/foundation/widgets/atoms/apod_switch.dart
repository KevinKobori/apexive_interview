import 'package:flutter/material.dart';

class ApodSwitch extends StatelessWidget {
  const ApodSwitch.adaptive({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      thumbColor: Theme.of(context).switchTheme.thumbColor,
      trackColor: Theme.of(context).switchTheme.trackColor,
      value: value,
      onChanged: onChanged,
    );
  }
}
