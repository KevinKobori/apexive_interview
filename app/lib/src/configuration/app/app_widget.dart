import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApodAppBuilder(
      debugShowCheckedModeBanner: false,
      colorMode: ApodAppThemeColorMode.dark,
      appLogo: ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/images/nasa_logo.svg',
      ),
      appWormLogo: ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/images/nasa_worm_logo.svg',
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Nasa Apod',
    );
  }
}
