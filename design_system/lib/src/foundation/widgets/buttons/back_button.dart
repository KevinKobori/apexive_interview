import 'package:flutter/material.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class ApodBackButton extends StatelessWidget {
  const ApodBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final assets = Theme.of(context).extension<XAssetsData>()!;

    return ApodIconButton(
      icon: ApodIcon.regular(
        assets.icons.characters.char(ApodIconCharacterKey.arrowBack),
      ),
      onPressed: () => Navigator.pop(context),
    );
  }
}
