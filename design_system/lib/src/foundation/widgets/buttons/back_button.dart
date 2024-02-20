import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodBackButton extends StatelessWidget {
  const ApodBackButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ApodThemeData>()!;
    return ApodActionButton(
      icon: (theme.icons.characters as ApodIconCharactersData).arrowBack,
      onTap: onTap ?? () => Navigator.pop(context),
    );
  }
}
