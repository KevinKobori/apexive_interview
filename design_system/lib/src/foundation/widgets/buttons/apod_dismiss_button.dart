import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodDismissButton extends StatelessWidget {
  final VoidCallback? onClose;
  final Color? color;

  const ApodDismissButton({
    super.key,
    this.onClose,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final assets = Theme.of(context).extension<XAssetsData>()!;

    return ApodIconButton(
      icon: ApodIcon.regular(
        assets.icons.characters.char(ApodIconCharacterKey.dismiss),
        color: color,
      ),
      onPressed: onClose,
    );
  }
}
