import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodDismissButton extends StatelessWidget {
  final VoidCallback? onClose;
  
  const ApodDismissButton({
    super.key,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final assets = Theme.of(context).extension<ApodAssetsData>()!;

    return ApodIconButton(
      icon: ApodIcon.regular(
          (assets.icons.characters as ApodIconCharactersData).dismiss),
      onPressed: onClose,
    );
  }
}
