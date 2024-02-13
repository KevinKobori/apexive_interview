import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';
import 'package:nasa_apod_design_system/src/helpers/named.dart';
import 'package:nasa_apod_design_system/src/theme/data/form_factor.dart';

import 'base.dart';

part 'colors.dart';
part 'icons.dart';
part 'radius.dart';
part 'shadows.dart';
part 'spacing.dart';
part 'typography.dart';

class ApodThemeLibrary extends StatelessWidget {
  const ApodThemeLibrary({
    required this.colorMode,
    required this.formFactor,
    super.key,
  });

  final ApodAppThemeColorMode colorMode;
  final ApodAppFormFactor formFactor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApodAppResponsiveTheme(
        appLogo: StringPicture(
          SvgPicture.svgStringDecoderBuilder,
          '<svg></svg>',
        ),
        appWarmLogo: StringPicture(
          SvgPicture.svgStringDecoderBuilder,
          '<svg></svg>',
        ),
        colorMode: colorMode,
        formFactor: formFactor,
        child: Builder(
          builder: (context) {
            return ThemeContainer(
              title: 'Apod Theme : ${formFactor.name} - ${colorMode.name}',
              sections: [
                colors(context),
                typography(context),
                icons(context),
                radius(context),
                spacing(context),
                shadow(context),
              ],
            );
          },
        ),
      ),
    );
  }
}
