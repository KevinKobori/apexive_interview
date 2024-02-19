import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

import 'base.dart';

part 'colors.dart';
part 'icons.dart';
part 'radius.dart';
part 'shadows.dart';
part 'spacing.dart';
part 'typography.dart';

class ApodThemeLibrary extends StatelessWidget {
  const ApodThemeLibrary({
    required this.themeMode,
    required this.formFactor,
    super.key,
  });

  final ThemeMode themeMode;
  final ApodAppFormFactor formFactor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApodAppBuilder(
        // appLogo: '<svg></svg>',
        // appWormLogo: '<svg></svg>',
        themeMode: themeMode,
        formFactor: formFactor,
        child: Builder(
          builder: (context) {
            return ThemeContainer(
              title: 'Apod Theme : ${formFactor.name} - ${themeMode.name}',
              sections: [
                // colors(context),
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
