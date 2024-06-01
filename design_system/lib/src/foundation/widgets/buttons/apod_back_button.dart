import 'package:flutter/material.dart';

class ApodBackButton extends StatelessWidget {
  const ApodBackButton.adaptive({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.adaptive.arrow_back_rounded),
      onPressed: () => Navigator.pop(context),
    );
    // final assets = Theme.of(context).extension<XAssetsData>()!;

    // return ApodIconButton(
    //   icon: Icon(Icons.adaptive.arrow_back),
    //   // icon: ApodIcon.regular(
    //   //   assets.icons.characters.char(ApodIconCharacterKey.arrowBack),
    //   // ),
    //   onPressed: () => Navigator.pop(context),
    // );
  }
}
