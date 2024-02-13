import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/src/theme/data/data.dart';

export 'data/colors.dart';
export 'data/data.dart';
export 'data/icons.dart';
export 'data/radius.dart';
export 'data/shadows.dart';
export 'data/spacing.dart';

class ApodTheme extends InheritedWidget {
  const ApodTheme({
    required this.data,
    required Widget child,
    super.key,
  }) : super(child: child);

  final ApodThemeData data;

  static ApodThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<ApodTheme>();
    return widget!.data;
  }

  @override
  bool updateShouldNotify(covariant ApodTheme oldWidget) {
    return data != oldWidget.data;
  }
}
