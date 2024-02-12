import 'package:flutter/widgets.dart';
import 'package:nasa_apod_design_system/src/theme/data/data.dart';

export 'data/colors.dart';
export 'data/data.dart';
export 'data/icons.dart';
export 'data/radius.dart';
export 'data/shadows.dart';
export 'data/spacing.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    required this.data,
    required Widget child,
    super.key,
  }) : super(child: child);

  final AppThemeData data;

  static AppThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    return widget!.data;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}
